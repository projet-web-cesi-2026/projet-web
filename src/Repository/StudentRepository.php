<?php

declare(strict_types=1);

namespace App\Repository;

use PDO;

class StudentRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    public function getAllPromotions(): array
    {
        $stmt = $this->pdo->query("
            SELECT id, label, academic_year
            FROM promotions
            ORDER BY academic_year DESC, label ASC
        ");

        return $stmt->fetchAll();
    }

    public function getActivePromotions(): array
    {
        $stmt = $this->pdo->query("
            SELECT id, label
            FROM promotions
            WHERE is_active = 1
            ORDER BY label ASC
        ");

        return $stmt->fetchAll();
    }

    public function countStudents(
        string $currentUserRole,
        array $allowedPromotionIds,
        ?int $selectedPromotionId,
        string $search
    ): int {
        $sql = "
            SELECT COUNT(*)
            FROM users u
            INNER JOIN student_profiles sp ON sp.user_id = u.id
            WHERE u.role = 'etudiant'
        ";

        $params = [];

        if ($currentUserRole === 'pilote') {
            if ($allowedPromotionIds === []) {
                $sql .= " AND 1 = 0 ";
            } else {
                $placeholders = [];
                foreach ($allowedPromotionIds as $index => $promotionId) {
                    $key = ':allowed_promotion_' . $index;
                    $placeholders[] = $key;
                    $params['allowed_promotion_' . $index] = (int) $promotionId;
                }

                $sql .= " AND sp.promotion_id IN (" . implode(', ', $placeholders) . ")";
            }
        }

        if ($selectedPromotionId !== null) {
            $sql .= " AND sp.promotion_id = :promotion_id";
            $params['promotion_id'] = $selectedPromotionId;
        }

        if ($search !== '') {
            $sql .= "
                AND (
                    u.nom LIKE :search_nom
                    OR u.prenom LIKE :search_prenom
                    OR u.email LIKE :search_email
                )
            ";

            $searchValue = '%' . $search . '%';
            $params['search_nom'] = $searchValue;
            $params['search_prenom'] = $searchValue;
            $params['search_email'] = $searchValue;
        }

        $stmt = $this->pdo->prepare($sql);

        foreach ($params as $name => $value) {
            if (in_array($name, ['search_nom', 'search_prenom', 'search_email'], true)) {
                $stmt->bindValue(':' . $name, $value, PDO::PARAM_STR);
            } else {
                $stmt->bindValue(':' . $name, (int) $value, PDO::PARAM_INT);
            }
        }

        $stmt->execute();

        return (int) $stmt->fetchColumn();
    }

    public function findStudentsPaginated(
        string $currentUserRole,
        array $allowedPromotionIds,
        ?int $selectedPromotionId,
        string $search,
        int $limit,
        int $offset
    ): array {
        $sql = "
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
        ";

        $params = [];

        if ($currentUserRole === 'pilote') {
            if ($allowedPromotionIds === []) {
                $sql .= " AND 1 = 0 ";
            } else {
                $placeholders = [];
                foreach ($allowedPromotionIds as $index => $promotionId) {
                    $key = ':allowed_promotion_' . $index;
                    $placeholders[] = $key;
                    $params['allowed_promotion_' . $index] = (int) $promotionId;
                }

                $sql .= " AND sp.promotion_id IN (" . implode(', ', $placeholders) . ")";
            }
        }

        if ($selectedPromotionId !== null) {
            $sql .= " AND sp.promotion_id = :promotion_id";
            $params['promotion_id'] = $selectedPromotionId;
        }

        if ($search !== '') {
            $sql .= "
                AND (
                    u.nom LIKE :search_nom
                    OR u.prenom LIKE :search_prenom
                    OR u.email LIKE :search_email
                )
            ";

            $searchValue = '%' . $search . '%';
            $params['search_nom'] = $searchValue;
            $params['search_prenom'] = $searchValue;
            $params['search_email'] = $searchValue;
        }

        $sql .= "
            ORDER BY p.academic_year DESC, p.label ASC, u.nom ASC, u.prenom ASC
            LIMIT :limit OFFSET :offset
        ";

        $stmt = $this->pdo->prepare($sql);

        foreach ($params as $name => $value) {
            if (in_array($name, ['search_nom', 'search_prenom', 'search_email'], true)) {
                $stmt->bindValue(':' . $name, $value, PDO::PARAM_STR);
            } else {
                $stmt->bindValue(':' . $name, (int) $value, PDO::PARAM_INT);
            }
        }

        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);

        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function findStudentById(int $studentId): array|false
    {
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
            WHERE u.id = :id
              AND u.role = 'etudiant'
            LIMIT 1
        ");
        $stmt->execute(['id' => $studentId]);

        return $stmt->fetch();
    }

    public function findStudentForEdit(int $studentId): array|false
    {
        $stmt = $this->pdo->prepare("
            SELECT
                u.id,
                u.nom,
                u.prenom,
                u.email,
                sp.formation,
                sp.promotion_id,
                sp.status,
                sp.last_activity
            FROM users u
            INNER JOIN student_profiles sp ON sp.user_id = u.id
            WHERE u.id = :id
              AND u.role = 'etudiant'
            LIMIT 1
        ");
        $stmt->execute(['id' => $studentId]);

        return $stmt->fetch();
    }

    public function findApplicationsByStudentId(int $studentId): array
    {
        $stmt = $this->pdo->prepare("
            SELECT
                c.id,
                c.status,
                c.created_at,
                c.lettre_motivation,
                c.cv_filename,
                o.id AS offre_id,
                o.titre,
                o.lieu,
                o.remuneration,
                o.duree_semaines,
                COALESCE(e.nom, o.entreprise) AS entreprise_nom
            FROM candidatures c
            INNER JOIN offres o ON o.id = c.offre_id
            LEFT JOIN entreprises e ON e.id = o.entreprise_id
            WHERE c.student_user_id = :id
            ORDER BY c.created_at DESC
        ");
        $stmt->execute(['id' => $studentId]);

        return $stmt->fetchAll();
    }

    public function isActivePromotion(int $promotionId): bool
    {
        $stmt = $this->pdo->prepare("
            SELECT id
            FROM promotions
            WHERE id = :id AND is_active = 1
            LIMIT 1
        ");
        $stmt->execute(['id' => $promotionId]);

        return (bool) $stmt->fetchColumn();
    }

    public function emailExists(string $email, ?int $excludeStudentId = null): bool
    {
        if ($excludeStudentId !== null) {
            $stmt = $this->pdo->prepare("
                SELECT id
                FROM users
                WHERE email = :email
                  AND id != :id
                LIMIT 1
            ");
            $stmt->execute([
                'email' => $email,
                'id' => $excludeStudentId,
            ]);
        } else {
            $stmt = $this->pdo->prepare("
                SELECT id
                FROM users
                WHERE email = :email
                LIMIT 1
            ");
            $stmt->execute([
                'email' => $email,
            ]);
        }

        return (bool) $stmt->fetch();
    }

    public function createStudent(
        string $nom,
        string $prenom,
        string $email,
        string $password,
        string $formation,
        int $promotionId,
        string $status
    ): int {
        $this->pdo->beginTransaction();

        try {
            $stmt = $this->pdo->prepare("
                INSERT INTO users (nom, prenom, email, password_hash, role)
                VALUES (:nom, :prenom, :email, :password_hash, 'etudiant')
            ");
            $stmt->execute([
                'nom' => $nom,
                'prenom' => $prenom,
                'email' => $email,
                'password_hash' => password_hash($password, PASSWORD_DEFAULT),
            ]);

            $studentId = (int) $this->pdo->lastInsertId();

            $stmt = $this->pdo->prepare("
                INSERT INTO student_profiles (user_id, formation, promotion_id, status, last_activity)
                VALUES (:user_id, :formation, :promotion_id, :status, CURDATE())
            ");
            $stmt->execute([
                'user_id' => $studentId,
                'formation' => $formation,
                'promotion_id' => $promotionId,
                'status' => $status,
            ]);

            $this->pdo->commit();

            return $studentId;
        } catch (\Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }

            throw $e;
        }
    }

    public function updateStudent(
        int $studentId,
        string $nom,
        string $prenom,
        string $email,
        string $formation,
        int $promotionId,
        string $status
    ): void {
        $this->pdo->beginTransaction();

        try {
            $stmt = $this->pdo->prepare("
                UPDATE users
                SET nom = :nom,
                    prenom = :prenom,
                    email = :email
                WHERE id = :id
                  AND role = 'etudiant'
            ");
            $stmt->execute([
                'id' => $studentId,
                'nom' => $nom,
                'prenom' => $prenom,
                'email' => $email,
            ]);

            $stmt = $this->pdo->prepare("
                UPDATE student_profiles
                SET formation = :formation,
                    promotion_id = :promotion_id,
                    status = :status,
                    last_activity = CURDATE()
                WHERE user_id = :user_id
            ");
            $stmt->execute([
                'user_id' => $studentId,
                'formation' => $formation,
                'promotion_id' => $promotionId,
                'status' => $status,
            ]);

            $this->pdo->commit();
        } catch (\Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }

            throw $e;
        }
    }

    public function deleteStudent(int $studentId): void
    {
        $this->pdo->beginTransaction();

        try {
            $stmt = $this->pdo->prepare('DELETE FROM student_wishlist WHERE user_id = :id');
            $stmt->execute(['id' => $studentId]);

            $stmt = $this->pdo->prepare('DELETE FROM candidatures WHERE student_user_id = :id');
            $stmt->execute(['id' => $studentId]);

            $stmt = $this->pdo->prepare('DELETE FROM student_profiles WHERE user_id = :id');
            $stmt->execute(['id' => $studentId]);

            $stmt = $this->pdo->prepare("
                DELETE FROM users
                WHERE id = :id
                  AND role = 'etudiant'
            ");
            $stmt->execute(['id' => $studentId]);

            $this->pdo->commit();
        } catch (\Throwable $e) {
            if ($this->pdo->inTransaction()) {
                $this->pdo->rollBack();
            }

            throw $e;
        }
    }
}