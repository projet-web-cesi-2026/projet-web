<?php

declare(strict_types=1);

namespace App\Repository;

use PDO;

class CookieConsentRepository
{
    public function __construct(private PDO $pdo)
    {
    }

    public function findByToken(string $consentToken): array|false
    {
        $stmt = $this->pdo->prepare("
            SELECT *
            FROM cookie_consents
            WHERE consent_token = :consent_token
            LIMIT 1
        ");
        $stmt->execute([
            'consent_token' => $consentToken,
        ]);

        return $stmt->fetch();
    }

    public function saveConsent(
        string $consentToken,
        bool $essential,
        bool $analytics,
        bool $marketing
    ): void {
        $existing = $this->findByToken($consentToken);

        if ($existing) {
            $stmt = $this->pdo->prepare("
                UPDATE cookie_consents
                SET
                    essential = :essential,
                    analytics = :analytics,
                    marketing = :marketing,
                    consented_at = NOW(),
                    updated_at = NOW()
                WHERE consent_token = :consent_token
            ");
            $stmt->execute([
                'consent_token' => $consentToken,
                'essential' => $essential ? 1 : 0,
                'analytics' => $analytics ? 1 : 0,
                'marketing' => $marketing ? 1 : 0,
            ]);

            return;
        }

        $stmt = $this->pdo->prepare("
            INSERT INTO cookie_consents (
                consent_token,
                essential,
                analytics,
                marketing,
                consented_at,
                created_at,
                updated_at
            )
            VALUES (
                :consent_token,
                :essential,
                :analytics,
                :marketing,
                NOW(),
                NOW(),
                NOW()
            )
        ");
        $stmt->execute([
            'consent_token' => $consentToken,
            'essential' => $essential ? 1 : 0,
            'analytics' => $analytics ? 1 : 0,
            'marketing' => $marketing ? 1 : 0,
        ]);
    }
}