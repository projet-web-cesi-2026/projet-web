<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use App\Security\Csrf;
use App\Support\PilotPromotionAccess;

class PilotStudentDeleteController
{
    public function delete(int $studentId): void
    {
        if (
            !isset($_SESSION['user'])
            || !in_array($_SESSION['user']['role'] ?? null, ['pilote', 'administrateur'], true)
        ) {
            header('Location: /connexion');
            exit;
        }

        Csrf::requireValidToken($_POST['_csrf_token'] ?? null);

        $pdo = Database::getConnection();
        $currentUserRole = $_SESSION['user']['role'] ?? null;

        if ($currentUserRole === 'pilote') {
            $pilotId = (int) ($_SESSION['user']['id'] ?? 0);
            if (!PilotPromotionAccess::pilotCanAccessStudent($pdo, $pilotId, $studentId)) {
                http_response_code(403);
                exit('Accès refusé à cet étudiant.');
            }
        }

        try {
            $pdo->beginTransaction();

            $stmt = $pdo->prepare('DELETE FROM student_wishlist WHERE user_id = :id');
            $stmt->execute(['id' => $studentId]);

            $stmt = $pdo->prepare('DELETE FROM candidatures WHERE student_user_id = :id');
            $stmt->execute(['id' => $studentId]);

            $stmt = $pdo->prepare('DELETE FROM student_profiles WHERE user_id = :id');
            $stmt->execute(['id' => $studentId]);

            $stmt = $pdo->prepare("
                DELETE FROM users
                WHERE id = :id
                  AND role = 'etudiant'
            ");
            $stmt->execute(['id' => $studentId]);

            $pdo->commit();
        } catch (\Throwable $e) {
            if ($pdo->inTransaction()) {
                $pdo->rollBack();
            }
        }

        header('Location: /pilot-etudiants');
        exit;
    }
}