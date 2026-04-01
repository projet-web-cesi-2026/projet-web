<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use App\Repository\ApplicationRepository;
use App\Repository\WishlistRepository;
use Twig\Environment;

class StudentDashboardController
{
    private Environment $twig;
    private ApplicationRepository $applicationRepository;
    private WishlistRepository $wishlistRepository;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;

        $pdo = Database::getConnection();
        $this->applicationRepository = new ApplicationRepository($pdo);
        $this->wishlistRepository = new WishlistRepository($pdo);
    }

    public function index(): string
    {
        if (!isset($_SESSION['user']) || ($_SESSION['user']['role'] ?? null) !== 'etudiant') {
            header('Location: /connexion');
            exit;
        }

        $userId = (int) $_SESSION['user']['id'];

        $applicationsCount = $this->applicationRepository->countApplicationsByStudentUserId($userId);
        $wishlistCount = $this->wishlistRepository->countWishlistOffersByUserId($userId);
        $recentApplications = $this->applicationRepository->findRecentApplicationsByStudentUserId($userId, 5);

        return $this->twig->render('student-dashboard.html.twig', [
            'site_name' => 'Help Me Stage',
            'stats' => [
                'applications' => $applicationsCount,
                'wishlist' => $wishlistCount,
            ],
            'recent_applications' => $recentApplications,
        ]);
    }
}