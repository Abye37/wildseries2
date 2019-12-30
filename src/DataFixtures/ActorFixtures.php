<?php
namespace App\DataFixtures;
use App\Entity\Actor;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class ActorFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        for ($i = 0; $i <= 5; $i++) {  
            $actor = new Actor();  
            $actor->setName('Nom actor ' . $i);
            $manager->persist($actor);
        }  
        $manager->flush();
}
public function getDependencies()  

{  

    return [ProgramFixtures::class];  

}
}
