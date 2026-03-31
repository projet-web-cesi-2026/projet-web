<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use Twig\Environment;
use PDO;

class PilotOffersController
{
    private Environment $twig;
    private const PER_PAGE = 10;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
    }

    public function index(): string
    {
        if (
            !isset($_SESSION['user'])
            || !in_array($_SESSION['user']['role'] ?? null, ['pilote', 'administrateur'], true)
        ) {
            header('Location: /connexion');
            exit;
        }

        $pdo = Database::getConnection();

        $search = trim((string) ($_GET['q'] ?? ''));

        $page = filter_input(INPUT_GET, 'page', FILTER_VALIDATE_INT);
        $page = ($page !== false && $page !== null && $page > 0) ? $page : 1;

        $countSql = "
            SELECT COUNT(*)
            FROM offres o
            LEFT JOIN entreprises e ON e.id = o.entreprise_id
            WHERE 1 = 1
        ";

        $dataSql = "
            SELECT
                o.id,
                o.titre,
                o.lieu,
                o.remuneration,
                o.duree_semaines,
                o.created_at,
                COALESCE(e.nom, o.entreprise) AS entreprise_nom
            FROM offres o
            LEFT JOIN entreprises e ON e.id = o.entreprise_id
            WHERE 1 = 1
        ";

        $countParams = [];
        $dataParams = [];

        if ($search !== '') {
            $countSql .= "
                AND (
                    o.titre LIKE :count_search_title
                    OR o.lieu LIKE :count_search_location
                    OR o.entreprise LIKE :count_search_company
                    OR e.nom LIKE :count_search_company_name
                )
            ";

            $dataSql .= "
                AND (
                    o.titre LIKE :data_search_title
                    OR o.lieu LIKE :data_search_location
                    OR o.entreprise LIKE :data_search_company
                    OR e.nom LIKE :data_search_company_name
                )
            ";

            $searchValue = '%' . $search . '%';

            $countParams['count_search_title'] = $searchValue;
            $countParams['count_search_location'] = $searchValue;
            $countParams['count_search_company'] = $searchValue;
            $countParams['count_search_company_name'] = $searchValue;

            $dataParams['data_search_title'] = $searchValue;
            $dataParams['data_search_location'] = $searchValue;
            $dataParams['data_search_company'] = $searchValue;
            $dataParams['data_search_company_name'] = $searchValue;
        }

        $countStmt = $pdo->prepare($countSql);
        $countStmt->execute($countParams);
        $totalOffers = (int) $countStmt->fetchColumn();

        $totalPages = max(1, (int) ceil($totalOffers / self::PER_PAGE));

        if ($page > $totalPages) {
            $page = $totalPages;
        }

        $offset = ($page - 1) * self::PER_PAGE;

        $dataSql .= "
            ORDER BY o.created_at DESC, o.id DESC
            LIMIT :limit OFFSET :offset
        ";

        $stmt = $pdo->prepare($dataSql);

        foreach ($dataParams as $key => $value) {
            $stmt->bindValue(':' . $key, $value, PDO::PARAM_STR);
        }

        $stmt->bindValue(':limit', self::PER_PAGE, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();

        $offers = $stmt->fetchAll();

        $suggestionsStmt = $pdo->query("
            SELECT suggestion
            FROM (
                SELECT TRIM(o.titre) AS suggestion
                FROM offres o
                WHERE o.titre IS NOT NULL AND TRIM(o.titre) <> ''

                UNION

                SELECT TRIM(COALESCE(e.nom, o.entreprise)) AS suggestion
                FROM offres o
                LEFT JOIN entreprises e ON e.id = o.entreprise_id
                WHERE COALESCE(e.nom, o.entreprise) IS NOT NULL
                  AND TRIM(COALESCE(e.nom, o.entreprise)) <> ''

                UNION

                SELECT TRIM(o.lieu) AS suggestion
                FROM offres o
                WHERE o.lieu IS NOT NULL AND TRIM(o.lieu) <> ''
            ) AS suggestions
            ORDER BY suggestion ASC
        ");

        $offerSuggestions = $suggestionsStmt->fetchAll(PDO::FETCH_COLUMN);

        return $this->twig->render('pilot-offers.html.twig', [
            'offers' => $offers,
            'currentPage' => $page,
            'totalPages' => $totalPages,
            'totalOffers' => $totalOffers,
            'search' => $search,
            'offerTitles' => $offerSuggestions,
        ]);
    }
}