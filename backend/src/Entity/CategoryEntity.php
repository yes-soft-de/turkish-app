<?php

namespace App\Entity;

use App\Repository\CategoryEntityRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=CategoryEntityRepository::class)
 */
class CategoryEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $name;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $lang;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $arabicName;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $turkishName;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $arabicDescription;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $turkishDescription;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getLang(): ?string
    {
        return $this->lang;
    }

    public function setLang(?string $lang): self
    {
        $this->lang = $lang;

        return $this;
    }

    public function getArabicName(): ?string
    {
        return $this->arabicName;
    }

    public function setArabicName(?string $arabicName): self
    {
        $this->arabicName = $arabicName;

        return $this;
    }

    public function getTurkishName(): ?string
    {
        return $this->turkishName;
    }

    public function setTurkishName(?string $turkishName): self
    {
        $this->turkishName = $turkishName;

        return $this;
    }

    public function getArabicDescription(): ?string
    {
        return $this->arabicDescription;
    }

    public function setArabicDescription(?string $arabicDescription): self
    {
        $this->arabicDescription = $arabicDescription;

        return $this;
    }

    public function getTurkishDescription(): ?string
    {
        return $this->turkishDescription;
    }

    public function setTurkishDescription(?string $turkishDescription): self
    {
        $this->turkishDescription = $turkishDescription;

        return $this;
    }
}
