<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20201028163433 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE car_entity ADD image VARCHAR(255) NOT NULL, ADD special_link TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE device_entity ADD image VARCHAR(255) NOT NULL, ADD special_link TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE real_estate_entity ADD image VARCHAR(255) NOT NULL, ADD special_link TINYINT(1) DEFAULT NULL, ADD real_estate_type VARCHAR(50) NOT NULL, ADD number_of_floors VARCHAR(255) NOT NULL, ADD cladding VARCHAR(255) NOT NULL, ADD home_furnishing VARCHAR(50) NOT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE car_entity DROP image, DROP special_link');
        $this->addSql('ALTER TABLE device_entity DROP image, DROP special_link');
        $this->addSql('ALTER TABLE real_estate_entity DROP image, DROP special_link, DROP real_estate_type, DROP number_of_floors, DROP cladding, DROP home_furnishing');
    }
}
