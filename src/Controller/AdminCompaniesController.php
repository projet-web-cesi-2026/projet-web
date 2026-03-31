<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use Twig\Environment;

class AdminCompaniesController
{
    private Environment $twig;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
    }

    public function index(): string
    {
        if (
            !isset($_SESSION['user'])
            || !in_array($_SESSION['user']['role'] ?? null, ['administrateur', 'pilote'], true)
        ) {
            header('Location: /connexion');
            exit;
        }

        $pdo = Database::getConnection();

        $search = trim((string) ($_GET['q'] ?? ''));

        $sql = "
            SELECT
                id,
                nom,
                siret,
                secteur,
                ville,
                site_web,
                note,
                commentaire,
                created_at
            FROM entreprises
            WHERE 1 = 1
        ";

        $params = [];

        if ($search !== '') {
            $sql .= " AND (
                nom LIKE :search_nom
                OR siret LIKE :search_siret
                OR secteur LIKE :search_secteur
                OR ville LIKE :search_ville
            ) ";

            $searchValue = '%' . $search . '%';
            $params['search_nom'] = $searchValue;
            $params['search_siret'] = $searchValue;
            $params['search_secteur'] = $searchValue;
            $params['search_ville'] = $searchValue;
        }

        $sql .= " ORDER BY nom ASC ";

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        $companies = $stmt->fetchAll();

        return $this->twig->render('admin-companies.html.twig', [
            'companies' => $companies,
            'search' => $search,
        ]);
    }
}