<?php

declare(strict_types=1);

namespace App;

use PDO;
use PDOException;

class Database
{
    public static function getConnection(): PDO
    {
        try {
            $host = $_ENV['DB_HOST'] ?? '';
            $port = $_ENV['DB_PORT'] ?? '';
            $dbname = $_ENV['DB_NAME'] ?? '';
            $user = $_ENV['DB_USER'] ?? '';
            $pass = $_ENV['DB_PASS'] ?? '';

            if (!$host || !$port || !$dbname || !$user) {
                die('Erreur : variables .env manquantes');
            }

            $dsn = "mysql:host={$host};port={$port};dbname={$dbname};charset=utf8mb4";

            $pdo = new PDO($dsn, $user, $pass);

            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

            return $pdo;

        } catch (PDOException $e) {
            die('Erreur connexion DB : ' . $e->getMessage());
        }
    }
}