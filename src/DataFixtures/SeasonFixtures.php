<?php
namespace App\DataFixtures;
use App\Entity\Season;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Faker;
class SeasonFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager)
    {
        $faker  =  Faker\Factory::create('fr_FR');
        for ($i = 0; $i < 20; $i++)
        {
            $season = new Season();
            $season->setNumber($faker->randomDigit);
            $season->setYear($faker->year);
            $season->setDescription($faker->text);
            $manager->persist($season);
            $this->addReference('season_' . $i, $season);
            $season->setProgram($this->getReference('program_0'));
        }
        $manager->flush();
    }
    public function getDependencies()
    {
        return [ProgramFixtures::class];
    }
}
