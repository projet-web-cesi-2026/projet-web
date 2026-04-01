<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use App\Repository\CookieConsentRepository;

class CookieConsentController
{
    private CookieConsentRepository $cookieConsentRepository;

    public function __construct()
    {
        $this->cookieConsentRepository = new CookieConsentRepository(Database::getConnection());
    }

    public function save(): void
    {
        header('Content-Type: application/json');

        if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
            http_response_code(405);
            echo json_encode([
                'success' => false,
                'message' => 'Méthode non autorisée.',
            ]);
            return;
        }

        $rawBody = file_get_contents('php://input');
        $data = json_decode($rawBody ?: '', true);

        if (!is_array($data)) {
            http_response_code(400);
            echo json_encode([
                'success' => false,
                'message' => 'Payload invalide.',
            ]);
            return;
        }

        $consentToken = trim((string) ($data['consent_token'] ?? ''));
        $essential = true;
        $analytics = (bool) ($data['analytics'] ?? false);
        $marketing = (bool) ($data['marketing'] ?? false);

        if ($consentToken === '') {
            http_response_code(400);
            echo json_encode([
                'success' => false,
                'message' => 'Token de consentement manquant.',
            ]);
            return;
        }

        try {
            $this->cookieConsentRepository->saveConsent(
                $consentToken,
                $essential,
                $analytics,
                $marketing
            );

            echo json_encode([
                'success' => true,
            ]);
        } catch (\Throwable $e) {
            http_response_code(500);
            echo json_encode([
                'success' => false,
                'message' => 'Erreur lors de l’enregistrement du consentement.',
            ]);
        }
    }
}