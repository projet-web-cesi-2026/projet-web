<?php

declare(strict_types=1);

namespace App\Controller;

use App\Database;
use App\Repository\ApplicationRepository;
use App\Security\Csrf;
use Twig\Environment;

class PilotApplicationController
{
    private Environment $twig;
    private ApplicationRepository $applicationRepository;
    private const PER_PAGE = 10;

    public function __construct(Environment $twig)
    {
        $this->twig = $twig;
        $this->applicationRepository = new ApplicationRepository(Database::getConnection());
    }

    public function index(): string
    {
        if (
            !isset($_SESSION['user'])
            || !in_array($_SESSION['user']['role'] ?? null, ['pilote', 'administrateur'], true)
        ) {
            header('Location: /connexion');
            exit;
        }

        $selectedPromotionId = isset($_GET['promotion_id']) && ctype_digit((string) $_GET['promotion_id'])
            ? (int) $_GET['promotion_id']
            : null;

        $search = trim((string) ($_GET['q'] ?? ''));

        $currentPage = isset($_GET['page']) && ctype_digit((string) $_GET['page']) && (int) $_GET['page'] > 0
            ? (int) $_GET['page']
            : 1;

        $promotions = $this->applicationRepository->getActivePromotions();

        $totalApplications = $this->applicationRepository->countApplications($selectedPromotionId, $search);

        $totalPages = max(1, (int) ceil($totalApplications / self::PER_PAGE));

        if ($currentPage > $totalPages) {
            $currentPage = $totalPages;
        }

        $offset = ($currentPage - 1) * self::PER_PAGE;

        $applications = $this->applicationRepository->findApplicationsPaginated(
            $selectedPromotionId,
            $search,
            self::PER_PAGE,
            $offset
        );

        return $this->twig->render('pilot-applications.html.twig', [
            'applications' => $applications,
            'promotions' => $promotions,
            'selected_promotion_id' => $selectedPromotionId,
            'search' => $search,
            'currentPage' => $currentPage,
            'totalPages' => $totalPages,
            'totalApplications' => $totalApplications,
        ]);
    }

    public function updateStatus(int $applicationId): void
    {
        if (
            !isset($_SESSION['user'])
            || !in_array($_SESSION['user']['role'] ?? null, ['pilote', 'administrateur'], true)
        ) {
            header('Location: /connexion');
            exit;
        }

        Csrf::requireValidToken($_POST['_csrf_token'] ?? null);

        $status = trim((string) ($_POST['status'] ?? ''));
        $allowed = ['acceptee', 'refusee'];

        if (!in_array($status, $allowed, true)) {
            http_response_code(400);
            exit('Statut invalide.');
        }

        try {
            $this->applicationRepository->updateApplicationStatusAndStudentProfile($applicationId, $status);
        } catch (\Throwable $e) {
            http_response_code(500);
            exit('Erreur lors de la mise à jour.');
        }

        header('Location: /pilot-candidatures');
        exit;
    }
}