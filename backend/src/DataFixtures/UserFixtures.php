<?php

namespace App\DataFixtures;

use App\Entity\UserEntity;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class UserFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        for($i = 0; $i < 20; $i++)
        {
            $user = new UserEntity("u" . $i);

            $user->setUserID("u" . $i);
            $user->setEmail("u" . $i . "@test.com");
            $user->setPassword("000");
            $user->setRoles(['user']);

            $manager->persist($user);
        }

        $manager->flush();
    }
}
