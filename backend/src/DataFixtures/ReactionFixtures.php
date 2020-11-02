<?php


namespace App\DataFixtures;


use App\Entity\ReactionEntity;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ReactionFixtures extends Fixture
{

    public function load(ObjectManager $manager)
    {
        for($i = 0; $i < 20; $i++)
        {
            $reaction = new ReactionEntity();

            $reaction->setEntity("car");
            $reaction->setCreatedBy("u" . $i);
            $reaction->setType(1);
            $reaction->setItemID($i);

            $manager->persist($reaction);
        }

        $manager->flush();
    }
}