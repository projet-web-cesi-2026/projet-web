<?php

declare(strict_types=1);

namespace App\Repository;

use PDO;

class StatisticsRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    public function countOffers(): int
    {
        return (int) $this->pdo
            ->query('SELECT COUNT(*) FROM offres')
            ->fetchColumn();
    }

    public function getAverageApplicationsPerOffer(): float
    {
        $stmt = $this->pdo->query('
            SELECT COALESCE(AVG(application_count), 0)
            FROM (
                SELECT o.id, COUNT(c.id) AS application_count
                FROM offres o
                LEFT JOIN candidatures c ON c.offre_id = o.id
                GROUP BY o.id
            ) AS offer_stats
        ');

        return round((float) $stmt->fetchColumn(), 1);
    }

    public function getOffersByDuration(): array
    {
        $stmt = $this->pdo->query('
            SELECT
                duree_semaines,
                COUNT(*) AS total
            FROM offres
            WHERE duree_semaines IS NOT NULL
            GROUP BY duree_semaines
            ORDER BY duree_semaines ASC
        ');

        return $stmt->fetchAll();
    }

    public function getTopWishlistOffers(int $limit = 5): array
    {
        $stmt = $this->pdo->prepare('
            SELECT
                o.id,
                o.titre,
                COALESCE(e.nom, o.entreprise) AS entreprise,
                COUNT(sw.offre_id) AS wishlist_count
            FROM student_wishlist sw
            INNER JOIN offres o ON o.id = sw.offre_id
            LEFT JOIN entreprises e ON e.id = o.entreprise_id
            GROUP BY o.id, o.titre, entreprise
            ORDER BY wishlist_count DESC, o.titre ASC
            LIMIT :limit
        ');
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}