<?php

declare(strict_types=1);

namespace App\Repository;

use PDO;

class WishlistRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    public function offerExists(int $offerId): bool
    {
        $stmt = $this->pdo->prepare("
            SELECT id
            FROM offres
            WHERE id = :id
            LIMIT 1
        ");
        $stmt->execute(['id' => $offerId]);

        return (bool) $stmt->fetchColumn();
    }

    public function addOfferToWishlist(int $userId, int $offerId): void
    {
        $stmt = $this->pdo->prepare("
            INSERT IGNORE INTO student_wishlist (user_id, offre_id)
            VALUES (:user_id, :offre_id)
        ");
        $stmt->execute([
            'user_id' => $userId,
            'offre_id' => $offerId,
        ]);
    }

    public function removeOfferFromWishlist(int $userId, int $offerId): void
    {
        $stmt = $this->pdo->prepare("
            DELETE FROM student_wishlist
            WHERE user_id = :user_id
              AND offre_id = :offre_id
        ");
        $stmt->execute([
            'user_id' => $userId,
            'offre_id' => $offerId,
        ]);
    }

    public function findWishlistOffersByUserId(int $userId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT
                o.id,
                o.titre,
                COALESCE(e.nom, o.entreprise, 'Entreprise non définie') AS entreprise_nom,
                o.lieu,
                o.duree_semaines,
                o.remuneration,
                sw.created_at
            FROM student_wishlist sw
            INNER JOIN offres o ON o.id = sw.offre_id
            LEFT JOIN entreprises e ON e.id = o.entreprise_id
            WHERE sw.user_id = :user_id
            ORDER BY sw.created_at DESC, o.id DESC
        ");
        $stmt->execute(['user_id' => $userId]);

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function countWishlistOffersByUserId(int $userId): int
    {
        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM student_wishlist
            WHERE user_id = :user_id
        ");
        $stmt->execute(['user_id' => $userId]);

        return (int) $stmt->fetchColumn();
    }
}