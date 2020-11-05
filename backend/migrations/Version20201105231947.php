<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20201105231947 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE image_entity DROP main_image');
        $this->addSql('ALTER TABLE real_estate_entity ADD rooms VARCHAR(50) DEFAULT NULL, CHANGE number_of_floors number_of_floors VARCHAR(50) NOT NULL');
        $this->addSql('ALTER TABLE status_entity DROP user_id');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE image_entity ADD main_image TINYINT(1) DEFAULT NULL');
        $this->addSql('ALTER TABLE real_estate_entity DROP rooms, CHANGE number_of_floors number_of_floors VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`');
        $this->addSql('ALTER TABLE status_entity ADD user_id VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`');
    }
}
