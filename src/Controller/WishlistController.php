<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use App\Repository\WishlistRepository;
use App\Security\Csrf;
use Twig\Environment;

class WishlistController
{
    private Environment $twig;
    private WishlistRepository $wishlistRepository;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
        $this->wishlistRepository = new WishlistRepository(Database::getConnection());
    }

    public function add(int $offerId): void
    {
        $this->assertStudent();
        Csrf::requireValidToken($_POST['_csrf_token'] ?? null);

        $userId = (int) $_SESSION['user']['id'];

        if (!$this->wishlistRepository->offerExists($offerId)) {
            http_response_code(404);
            exit('Offre introuvable.');
        }

        $this->wishlistRepository->addOfferToWishlist($userId, $offerId);

        header('Location: /offres/' . $offerId);
        exit;
    }

    public function remove(int $offerId): void
    {
        $this->assertStudent();
        Csrf::requireValidToken($_POST['_csrf_token'] ?? null);

        $userId = (int) $_SESSION['user']['id'];

        $this->wishlistRepository->removeOfferFromWishlist($userId, $offerId);

        header('Location: /offres/' . $offerId);
        exit;
    }

    private function assertStudent(): void
    {
        if (!isset($_SESSION['user'])) {
            header('Location: /connexion');
            exit;
        }

        if (($_SESSION['user']['role'] ?? null) !== 'etudiant') {
            http_response_code(403);
            exit('Accès refusé.');
        }
    }
}