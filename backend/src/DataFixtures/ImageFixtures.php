<?php


namespace App\DataFixtures;


use App\Entity\ImageEntity;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class ImageFixtures extends Fixture
{

    public function load(ObjectManager $manager)
    {
        for($i = 0; $i < 5; $i++)
        {
            $image = new ImageEntity();

            $image->setEntity("car" . $i);
            $image->setImage("img" . $i);
            $image->setItemID($i);
            $image->setSpecialLink(false);

            $manager->persist($image);
        }

        $manager->flush();
    }
}