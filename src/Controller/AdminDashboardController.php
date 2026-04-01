<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use App\Repository\DashboardRepository;
use Twig\Environment;

class AdminDashboardController
{
    private Environment $twig;
    private DashboardRepository $dashboardRepository;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
        $this->dashboardRepository = new DashboardRepository(Database::getConnection());
    }

    public function index(): string
    {
        if (!isset($_SESSION['user']) || ($_SESSION['user']['role'] ?? null) !== 'administrateur') {
            header('Location: /connexion');
            exit;
        }

        return $this->twig->render('admin-dashboard.html.twig', [
            'stats' => [
                'students' => $this->dashboardRepository->countStudents(),
                'pilots' => $this->dashboardRepository->countPilots(),
                'offers' => $this->dashboardRepository->countOffers(),
                'applications' => $this->dashboardRepository->countApplications(),
                'promotions' => $this->dashboardRepository->countPromotions(),
            ],
            'recent_students' => $this->dashboardRepository->findRecentStudents(5),
        ]);
    }
}