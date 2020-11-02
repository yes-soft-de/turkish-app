<?php


namespace App\DataFixtures;


use App\Entity\DeviceEntity;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class DeviceFixtures extends Fixture
{

    public function load(ObjectManager $manager)
    {
        for($i = 0; $i < 20; $i++)
        {
            $date = \DateTime::createFromFormat('Ymd', '2017'.$i.'01');
            $device = new DeviceEntity();

            $device->setModel(" " . $i);
            $device->setProductionYear($date);
            $device->setPrice("SP. " . $i);
            $device->setDescription("test " . $i);
            $device->setStatus("s " . $i);
            $device->setCreatedBy("u" . $i);
            $device->setImage("image" . $i);
            $device->setDurationOfUse("4");
            $device->setGauge("4");
            $device->setBattery("4");
            $device->setCpu("4");
            $device->setRam("4");
            $device->setLocation("Turkey");

            $manager->persist($device);
        }

        $manager->flush();
    }
}