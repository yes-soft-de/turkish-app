<?php

namespace App\Entity;

use App\Repository\RealEstateEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=RealEstateEntityRepository::class)
 */
class RealEstateEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $country;

    /**
     * @ORM\Column(type="string", length=100)
     */
    private $city;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $space;

    /**
     * @ORM\Column(type="integer")
     */
    private $price;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $status;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $createdBy;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $createdAt;
    
    /**
     * @Gedmo\Timestampable(on="update")
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $updateAt;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $state;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $image;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $specialLink;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $numberOfFloors;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $cladding;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $homeFurnishing;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $realEstateType;

    /**
     * @ORM\Column(type="string", length=50, nullable=true)
     */
    private $rooms;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $completeDate;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(int $id): self
    {
        $this->id = $id;
        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(string $city): self
    {
        $this->city = $city;

        return $this;
    }

    public function getSpace(): ?string
    {
        return $this->space;
    }

    public function setSpace(string $space): self
    {
        $this->space = $space;

        return $this;
    }

    public function getPrice(): ?int
    {
        return $this->price;
    }

    public function setPrice(int $price): self
    {
        $this->price = $price;

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

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(?string $status): self
    {
        $this->status = $status;

        return $this;
    }

    public function getCreatedBy(): ?string
    {
        return $this->createdBy;
    }

    public function setCreatedBy(string $createdBy): self
    {
        $this->createdBy = $createdBy;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt($createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    
    public function getUpdateAt(): ?\DateTimeInterface
    {
        return $this->updateAt;
    }

    public function setUpdateAt(\DateTimeInterface $updateAt): self
    {
        $this->updateAt = $updateAt;

        return $this;
    }
    
    public function getState(): ?string
    {
        return $this->state;
    }

    public function setState(?string $state): self
    {
        $this->state = $state;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getSpecialLink(): ?bool
    {
        return $this->specialLink;
    }

    public function setSpecialLink(?bool $specialLink): self
    {
        $this->specialLink = $specialLink;

        return $this;
    }

    public function getNumberOfFloors(): ?string
    {
        return $this->numberOfFloors;
    }

    public function setNumberOfFloors(string $numberOfFloors): self
    {
        $this->numberOfFloors = $numberOfFloors;

        return $this;
    }

    public function getCladding(): ?string
    {
        return $this->cladding;
    }

    public function setCladding(string $cladding): self
    {
        $this->cladding = $cladding;

        return $this;
    }

    public function getHomeFurnishing(): ?string
    {
        return $this->homeFurnishing;
    }

    public function setHomeFurnishing(string $homeFurnishing): self
    {
        $this->homeFurnishing = $homeFurnishing;

        return $this;
    }

    public function getRealEstateType(): ?string
    {
        return $this->realEstateType;
    }

    public function setRealEstateType(string $realEstateType): self
    {
        $this->realEstateType = $realEstateType;

        return $this;
    }

    public function getRooms(): ?string
    {
        return $this->rooms;
    }

    public function setRooms(?string $rooms): self
    {
        $this->rooms = $rooms;

        return $this;
    }

    public function getCompleteDate(): ?\DateTimeInterface
    {
        return $this->completeDate;
    }

    public function setCompleteDate(?\DateTimeInterface $completeDate): self
    {
        $this->completeDate = $completeDate;

        return $this;
    }
}
