<?php
namespace App\DataFixtures;
use App\Entity\Program;
use App\Entity\Category;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;

class ProgramFixtures extends Fixture implements DependentFixtureInterface
{
const PROGRAMS = [
    'Walking Dead' => [
    'synopsis' => 'Le policier Rick Grimes se réveille après un long coma.',
    'category' => 'categorie_4',
    'poster' => 'image',
    'country' => 'world',
    'years' => '0000',
    ],
    'The Haunting Of Hill House' => [
    'synopsis' => 'Plusieurs frères et sœurs qui, enfants, ont grandi dans la demeure qui allait devenir la maison hantée la plus célèbre des États-Unis.',
    'category' => 'categorie_4',
    'poster' => 'image',
    'country' => 'world',
    'years' => '0000',
    ],
    'American Horror Story' => [
    'synopsis' => 'A chaque saison, son histoire. American Horror Story nous embarque dans des récits à la fois poignants et cauchemardesques.',
    'category' => 'categorie_4',
    'poster' => 'image',
    'country' => 'world',
    'years' => '0000',
    ],
    'Love Death And Robots' => [
    'synopsis' => 'Un yaourt susceptible, des soldats lycanthropes, des robots déchaînés etc...',
    'category' => 'categorie_4',
    'poster' => 'image',
    'country' => 'world',
    'years' => '0000',
    ],
    'Penny Dreadful' => [
    'synopsis' => 'Dans le Londres ancien, Vanessa Ives, une jeune femme puissante aux pouvoirs hypnotiques, allie ses forces à celles de Ethan.',
    'category' => 'categorie_4',
    'poster' => 'image',
    'country' => 'world',
    'years' => '0000',
    ],
    'Fear The Walking Dead' => [
    'synopsis' => 'La série se déroule au tout début de l épidémie relatée dans la série mère The Walking Dead et se passe dans la ville de Los Angeles, et non à Atlanta.',
    'category' => 'categorie_4',
    'poster' => 'image',
    'country' => 'world',
    'years' => '0000',
    ],
    ];
    public function load(ObjectManager $manager)
    {
        $i = 0;
        foreach (self::PROGRAMS as $title => $data) {
            $program = new Program();
            $program->setTitle($title);
            $program->setSynopsis($data['synopsis']);
            $program->setPoster($data['poster']);
            $program->setCountry($data['country']);
            $program->setYear($data['years']);
            $this->addReference('program_' . $i, $program);
            $i++;
            $manager->persist($program);
        }
        $program->setCategory($this->getReference('categorie_0'));
        $manager->flush();
    }
    public function getDependencies()  

{  
    return [CategoryFixtures::class]; 
}
}
