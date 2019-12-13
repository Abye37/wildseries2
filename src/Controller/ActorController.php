<?php
namespace App\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\ProgramRepository;
use App\Repository\ActorRepository;
use Symfony\Component\HttpFoundation\Request;
use App\Entity\Actor;
use Symfony\Component\HttpFoundation\Response;

class ActorController extends AbstractController
{
    /**
     * @Route("/actor/{actorId<[0-9]+>}", name="show_actor")
     */
    public function showByActor(int $actorId, ActorRepository $actorRepository, ProgramRepository $programRepository):Response
    {
        $actor = $actorRepository->findOneById($actorId);
        return $this->render('wild/actor.html.twig', [
            'actor' => $actor,
        ]);
    }
}
