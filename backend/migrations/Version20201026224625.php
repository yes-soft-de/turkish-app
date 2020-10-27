<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20201026224625 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE car_entity ADD car_type VARCHAR(50) NOT NULL, ADD gear_type VARCHAR(50) NOT NULL, ADD cc VARCHAR(50) NOT NULL, ADD fuel VARCHAR(50) NOT NULL, ADD location VARCHAR(255) NOT NULL, CHANGE model brand VARCHAR(255) NOT NULL, CHANGE production_year year_of_release DATE DEFAULT NULL');
        $this->addSql('ALTER TABLE device_entity ADD gauge VARCHAR(255) NOT NULL, ADD location VARCHAR(255) NOT NULL, ADD duration_of_use VARCHAR(255) NOT NULL, CHANGE model brand VARCHAR(255) NOT NULL, CHANGE production_year year_of_release DATE DEFAULT NULL');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE car_entity ADD model VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, DROP brand, DROP car_type, DROP gear_type, DROP cc, DROP fuel, DROP location, CHANGE year_of_release production_year DATE DEFAULT NULL');
        $this->addSql('ALTER TABLE device_entity ADD model VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, DROP brand, DROP gauge, DROP location, DROP duration_of_use, CHANGE year_of_release production_year DATE DEFAULT NULL');
    }
}
