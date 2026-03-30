<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use Twig\Environment;

class AdminPilotsController
{
    private Environment $twig;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
    }

    public function index(): string
    {
        if (!isset($_SESSION['user']) || ($_SESSION['user']['role'] ?? null) !== 'administrateur') {
            header('Location: /connexion');
            exit;
        }

        $pdo = Database::getConnection();
        $search = trim((string) ($_GET['q'] ?? ''));

        $sql = "
            SELECT
                u.id,
                u.nom,
                u.prenom,
                u.email,
                u.created_at,
                COALESCE(GROUP_CONCAT(DISTINCT p.label ORDER BY p.label SEPARATOR ', '), '') AS promotions_labels
            FROM users u
            LEFT JOIN pilot_promotions pp ON pp.pilot_user_id = u.id
            LEFT JOIN promotions p ON p.id = pp.promotion_id
            WHERE u.role = 'pilote'
        ";

        $params = [];

        if ($search !== '') {
            $sql .= "
                AND (
                    u.nom LIKE :search
                    OR u.prenom LIKE :search
                    OR u.email LIKE :search
                    OR CONCAT(u.prenom, ' ', u.nom) LIKE :search
                    OR CONCAT(u.nom, ' ', u.prenom) LIKE :search
                )
            ";
            $params['search'] = '%' . $search . '%';
        }

        $sql .= "
            GROUP BY u.id, u.nom, u.prenom, u.email, u.created_at
            ORDER BY u.nom ASC, u.prenom ASC
        ";

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        $pilots = $stmt->fetchAll();

        return $this->twig->render('admin-pilots.html.twig', [
            'pilots' => $pilots,
            'search' => $search,
        ]);
    }
}