<?php
namespace App\DataFixtures;
use App\Entity\Program;
use App\Entity\Category;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
use Faker;
class ProgramFixtures extends Fixture implements DependentFixtureInterface
{
    const PROGRAMS = [
        'Walking Dead' => [
            'synopsis' => 'Le policier Rick Grimes se réveille après un long coma.',
            'category' => 'categorie_4',
            'poster' => 'http://fr.web.img5.acsta.net/pictures/17/10/20/14/48/4859838.jpg',
            'country' => 'USA',
            'year' => '1999',
        ],
        'The Haunting Of Hill House' => [
            'synopsis' => 'Plusieurs frères et sœurs qui, enfants, ont grandi dans la demeure qui allait devenir la maison hantée.',
            'category' => 'categorie_4',
            'poster' => 'http://fr.web.img5.acsta.net/pictures/17/10/20/14/48/4859838.jpg',
            'country' => 'USA',
            'year' => '1999',
        ],
        'American Horror Story' => [
            'synopsis' => 'A chaque saison, son histoire. American Horror Story nous embarque dans des récits à la fois poignants.',
            'category' => 'categorie_4',
            'poster' => 'http://fr.web.img5.acsta.net/pictures/17/10/20/14/48/4859838.jpg',
            'country' => 'USA',
            'year' => '1999',
        ],
        'Love Death And Robots' => [
            'synopsis' => 'Un yaourt susceptible, des soldats lycanthropes, des robots déchaînés, des monstres-poubelles.',
            'category' => 'categorie_4',
            'poster' => 'http://fr.web.img5.acsta.net/pictures/17/10/20/14/48/4859838.jpg',
            'country' => 'USA',
            'year' => '1999',
        ],
        'Penny Dreadful' => [
            'synopsis' => 'Dans le Londres ancien, Vanessa Ives, une jeune femme puissante aux pouvoirs hypnotiques.',
            'category' => 'categorie_4',
            'poster' => 'http://fr.web.img5.acsta.net/pictures/17/10/20/14/48/4859838.jpg',
            'country' => 'USA',
            'year' => '1999',
        ],
        'Fear The Walking Dead' => [
            'synopsis' => 'La série se déroule au tout début de l épidémie relatée dans la série mère The Walking Dead.',
            'category' => 'categorie_4',
            'poster' => 'http://fr.web.img5.acsta.net/pictures/17/10/20/14/48/4859838.jpg',
            'country' => 'USA',
            'year' => '1999',
        ],
    ];
    public function load(ObjectManager $manager)
    {
        $faker=Faker\Factory::create('fr_FR');
        $i = 0;
        foreach (self::PROGRAMS as $title => $data)
        {
            $program = new Program();
            $program->setTitle($title);
            $program->setSynopsis($data['synopsis']);
            $program->setPoster($data['poster']);
            $program->setCountry($data['country']);
            $program->setYear($data['year']);
            $manager->persist($program);
            $this->addReference('program_' . $i, $program);
            //$this->setReference('walking', $program);
            $i++;
            $program->setCategory($this->getReference('categorie_0'));
        }
        $manager->flush();
    }
    public function getDependencies()
    {
        return [CategoryFixtures::class];
    }
}
