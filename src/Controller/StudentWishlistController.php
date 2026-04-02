<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use App\Repository\WishlistRepository;
use App\Security\Csrf;
use Twig\Environment;

class StudentWishlistController
{
    private Environment $twig;
    private WishlistRepository $wishlistRepository;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
        $this->wishlistRepository = new WishlistRepository(Database::getConnection());
    }

    public function index(): string
    {
        if (!isset($_SESSION['user'])) {
            header('Location: /connexion');
            exit;
        }

        if (($_SESSION['user']['role'] ?? null) !== 'etudiant') {
            http_response_code(403);
            return 'Accès refusé.';
        }

        $userId = (int) ($_SESSION['user']['id'] ?? 0);

        $wishlistOffers = $this->wishlistRepository->findWishlistOffersByUserId($userId);

        return $this->twig->render('student-wishlist.html.twig', [
            'wishlistOffers' => $wishlistOffers,
            'wishlistCount' => count($wishlistOffers),
            'csrf_token' => Csrf::token(),
        ]);
    }
}