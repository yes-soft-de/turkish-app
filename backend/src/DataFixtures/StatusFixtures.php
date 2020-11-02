<?php


namespace App\DataFixtures;


use App\Entity\StatusEntity;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class StatusFixtures extends Fixture
{

    public function load(ObjectManager $manager)
    {
        for($i = 0; $i < 20; $i++)
        {
            $status = new StatusEntity();

            $status->setCreatedBy("u" . $i);
            $status->setUserID("u" . ($i+2));
            $status->setStatus("agreement " . $i);
            $status->setLawyerID("l" . $i);

            $manager->persist($status);
        }

        $manager->flush();
    }
}