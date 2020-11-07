<?php


namespace App\DataFixtures;


use App\Entity\RealEstateEntity;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class RealEstateFixtures extends Fixture
{

    public function load(ObjectManager $manager)
    {
        for($i = 0; $i < 20; $i++)
        {
            $realEstate = new RealEstateEntity();

            $realEstate->setImage("image" . $i);
            $realEstate->setRealEstateType("apartment");
            $realEstate->setHomeFurnishing("Furnished");
            $realEstate->setCladding("Delux");
            $realEstate->setNumberOfFloors($i);
            $realEstate->setStatus("for sell");
            $realEstate->setDescription("des. " . $i);
            $realEstate->setPrice($i*2);
            $realEstate->setSpace($i+10 . " sm");
            $realEstate->setCity("Adna");
            $realEstate->setState("Ankara");
            $realEstate->setCreatedBy("u" . $i);
            $realEstate->setRooms("3");

            $manager->persist($realEstate);
        }

        $manager->flush();
    }
}