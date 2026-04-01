<?php

declare(strict_types=1);

namespace App\Repository;

use PDO;

class DashboardRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    // =========================
    // PILOT
    // =========================

    public function countPilotStudents(array $allowedPromotionIds): int
    {
        [$filterSql, $params] = $this->buildPromotionFilter($allowedPromotionIds, 'sp.promotion_id');

        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM users u
            INNER JOIN student_profiles sp ON sp.user_id = u.id
            WHERE u.role = 'etudiant'
            $filterSql
        ");
        $stmt->execute($params);

        return (int) $stmt->fetchColumn();
    }

    public function countPilotStudentsWithoutStage(array $allowedPromotionIds): int
    {
        [$filterSql, $params] = $this->buildPromotionFilter($allowedPromotionIds, 'sp.promotion_id');

        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM student_profiles sp
            WHERE sp.status = 'sans_stage'
            $filterSql
        ");
        $stmt->execute($params);

        return (int) $stmt->fetchColumn();
    }

    public function countPilotApplications(array $allowedPromotionIds): int
    {
        [$filterSql, $params] = $this->buildPromotionFilter($allowedPromotionIds, 'sp.promotion_id');

        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM candidatures c
            INNER JOIN student_profiles sp ON sp.user_id = c.student_user_id
            WHERE 1 = 1
            $filterSql
        ");
        $stmt->execute($params);

        return (int) $stmt->fetchColumn();
    }

    public function countPilotValidatedStages(array $allowedPromotionIds): int
    {
        [$filterSql, $params] = $this->buildPromotionFilter($allowedPromotionIds, 'sp.promotion_id');

        $stmt = $this->pdo->prepare("
            SELECT COUNT(*)
            FROM student_profiles sp
            WHERE sp.status = 'stage_valide'
            $filterSql
        ");
        $stmt->execute($params);

        return (int) $stmt->fetchColumn();
    }

    public function findRecentPilotStudents(array $allowedPromotionIds, int $limit = 5): array
    {
        [$filterSql, $params] = $this->buildPromotionFilter($allowedPromotionIds, 'sp.promotion_id');

        $stmt = $this->pdo->prepare("
            SELECT
                u.id,
                u.nom,
                u.prenom,
                u.email,
                sp.formation,
                sp.status,
                sp.last_activity,
                p.label AS promotion_label,
                p.academic_year
            FROM users u
            INNER JOIN student_profiles sp ON sp.user_id = u.id
            LEFT JOIN promotions p ON p.id = sp.promotion_id
            WHERE u.role = 'etudiant'
            $filterSql
            ORDER BY sp.last_activity DESC, u.id DESC
            LIMIT :limit
        ");

        foreach ($params as $key => $value) {
            $stmt->bindValue(':' . $key, (int) $value, PDO::PARAM_INT);
        }

        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    // =========================
    // ADMIN
    // =========================

    public function countStudents(): int
    {
        return (int) $this->pdo
            ->query("SELECT COUNT(*) FROM users WHERE role = 'etudiant'")
            ->fetchColumn();
    }

    public function countPilots(): int
    {
        return (int) $this->pdo
            ->query("SELECT COUNT(*) FROM users WHERE role = 'pilote'")
            ->fetchColumn();
    }

    public function countOffers(): int
    {
        return (int) $this->pdo
            ->query("SELECT COUNT(*) FROM offres")
            ->fetchColumn();
    }

    public function countApplications(): int
    {
        return (int) $this->pdo
            ->query("SELECT COUNT(*) FROM candidatures")
            ->fetchColumn();
    }

    public function countPromotions(): int
    {
        return (int) $this->pdo
            ->query("SELECT COUNT(*) FROM promotions")
            ->fetchColumn();
    }

    public function findRecentStudents(int $limit = 5): array
    {
        $stmt = $this->pdo->prepare("
            SELECT
                u.id,
                u.nom,
                u.prenom,
                u.email,
                sp.formation,
                sp.status,
                sp.last_activity
            FROM users u
            INNER JOIN student_profiles sp ON sp.user_id = u.id
            WHERE u.role = 'etudiant'
            ORDER BY sp.last_activity DESC
            LIMIT :limit
        ");

        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }

    // =========================
    // UTIL
    // =========================

    private function buildPromotionFilter(array $allowedPromotionIds, string $column): array
    {
        if ($allowedPromotionIds === []) {
            return [' AND 1 = 0 ', []];
        }

        $placeholders = [];
        $params = [];

        foreach ($allowedPromotionIds as $index => $promotionId) {
            $key = 'promotion_' . $index;
            $placeholders[] = ':' . $key;
            $params[$key] = (int) $promotionId;
        }

        $sql = ' AND ' . $column . ' IN (' . implode(', ', $placeholders) . ') ';

        return [$sql, $params];
    }
}