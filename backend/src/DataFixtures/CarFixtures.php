<?php


namespace App\DataFixtures;


use App\Entity\CarEntity;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class CarFixtures extends Fixture
{

    public function load(ObjectManager $manager)
    {
        for($i = 0; $i < 20; $i++)
        {
            $date = \DateTime::createFromFormat('Ymd', '2017'.$i.'01');
            $car = new CarEntity();

            $car->setModel("b " . $i);
            $car->setCompany("b " . $i);
            $car->setProductionYear($date);
            $car->setEngine("eng " . $i);
            $car->setPrice(" " . $i);
            $car->setDescription("des " . $i);
            $car->setStatus("for sell");
            $car->setCreatedBy("u" . $i);
            $car->setDistance("sm: " . $i);
            $car->setCarType("jeep");
            $car->setGearType("manual");
            $car->setCc(" " . $i);
            $car->setFuel("diesel");
            $car->setLocation("syria");
            $car->setImage("image" . $i);

            $manager->persist($car);
        }

        $manager->flush();
    }
}