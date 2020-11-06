<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20201106002520 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE car_entity (id INT AUTO_INCREMENT NOT NULL, brand VARCHAR(255) NOT NULL, company VARCHAR(255) NOT NULL, year_of_release DATE DEFAULT NULL, engine VARCHAR(255) NOT NULL, price INT DEFAULT NULL, description LONGTEXT DEFAULT NULL, status VARCHAR(255) NOT NULL, created_by VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, distance VARCHAR(255) NOT NULL, car_type VARCHAR(50) NOT NULL, gear_type VARCHAR(50) NOT NULL, cc VARCHAR(50) NOT NULL, fuel VARCHAR(50) NOT NULL, location VARCHAR(255) NOT NULL, image VARCHAR(255) NOT NULL, special_link TINYINT(1) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE device_entity (id INT AUTO_INCREMENT NOT NULL, brand VARCHAR(255) NOT NULL, cpu VARCHAR(255) NOT NULL, ram VARCHAR(255) NOT NULL, battery VARCHAR(255) NOT NULL, price INT NOT NULL, year_of_release DATE DEFAULT NULL, description LONGTEXT DEFAULT NULL, status VARCHAR(255) NOT NULL, created_by VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, gauge VARCHAR(255) NOT NULL, location VARCHAR(255) NOT NULL, duration_of_use VARCHAR(255) NOT NULL, image VARCHAR(255) NOT NULL, special_link TINYINT(1) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE image_entity (id INT AUTO_INCREMENT NOT NULL, image VARCHAR(255) NOT NULL, entity VARCHAR(50) NOT NULL, item_id INT NOT NULL, special_link TINYINT(1) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE reaction_entity (id INT AUTO_INCREMENT NOT NULL, created_by VARCHAR(255) NOT NULL, type INT NOT NULL, created_at DATETIME NOT NULL, item_id INT NOT NULL, entity VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE real_estate_entity (id INT AUTO_INCREMENT NOT NULL, city VARCHAR(255) NOT NULL, space VARCHAR(255) NOT NULL, price INT NOT NULL, description LONGTEXT DEFAULT NULL, status VARCHAR(255) DEFAULT NULL, created_by VARCHAR(255) NOT NULL, created_at DATETIME DEFAULT NULL, state VARCHAR(255) DEFAULT NULL, image VARCHAR(255) NOT NULL, special_link TINYINT(1) DEFAULT NULL, number_of_floors VARCHAR(50) NOT NULL, cladding VARCHAR(255) NOT NULL, home_furnishing VARCHAR(50) NOT NULL, real_estate_type VARCHAR(50) NOT NULL, rooms VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE setting_entity (id INT AUTO_INCREMENT NOT NULL, upload_sub_folder VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE status_entity (id INT AUTO_INCREMENT NOT NULL, created_by VARCHAR(255) NOT NULL, lawyer_id VARCHAR(255) NOT NULL, status VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_entity (id INT AUTO_INCREMENT NOT NULL, user_id VARCHAR(250) NOT NULL, roles JSON NOT NULL, password VARCHAR(255) DEFAULT NULL, create_date DATE DEFAULT NULL, email VARCHAR(255) DEFAULT NULL, UNIQUE INDEX UNIQ_6B7A5F55A76ED395 (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE user_profile_entity (id INT AUTO_INCREMENT NOT NULL, user_id VARCHAR(255) NOT NULL, user_name VARCHAR(255) NOT NULL, location VARCHAR(255) DEFAULT NULL, story LONGTEXT DEFAULT NULL, image VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE car_entity');
        $this->addSql('DROP TABLE device_entity');
        $this->addSql('DROP TABLE image_entity');
        $this->addSql('DROP TABLE reaction_entity');
        $this->addSql('DROP TABLE real_estate_entity');
        $this->addSql('DROP TABLE setting_entity');
        $this->addSql('DROP TABLE status_entity');
        $this->addSql('DROP TABLE user_entity');
        $this->addSql('DROP TABLE user_profile_entity');
    }
}
