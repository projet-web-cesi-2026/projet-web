<?php

declare(strict_types=1);

namespace App\Repository;

use PDO;

class UserRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    /**
     * Utilisé pour la connexion (login)
     */
    public function findLoginUserByEmail(string $email): array|false
    {
        $stmt = $this->pdo->prepare("
            SELECT
                id,
                nom,
                prenom,
                email,
                password_hash,
                role
            FROM users
            WHERE email = :email
            LIMIT 1
        ");
        $stmt->execute([
            'email' => $email,
        ]);

        return $stmt->fetch();
    }

    /**
     * Optionnel : récupération simple d’un user
     */
    public function findById(int $userId): array|false
    {
        $stmt = $this->pdo->prepare("
            SELECT id, nom, prenom, email, role
            FROM users
            WHERE id = :id
            LIMIT 1
        ");
        $stmt->execute([
            'id' => $userId,
        ]);

        return $stmt->fetch();
    }
}