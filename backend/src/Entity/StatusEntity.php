<?php

namespace App\Entity;

use App\Repository\StatusEntityRepository;
use Doctrine\ORM\Mapping as ORM;

use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=StatusEntityRepository::class)
 */
class StatusEntity
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $createdBy;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $lawyerID;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $status;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="string", length=50)
     */
    private $entity;

    /**
     * @ORM\Column(type="integer")
     */
    private $itemID;


    public function getId(): ?int
    {
        return $this->id;
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

    public function getLawyerID(): ?string
    {
        return $this->lawyerID;
    }

    public function setLawyerID(string $lawyerID): self
    {
        $this->lawyerID = $lawyerID;

        return $this;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(string $status): self
    {
        $this->status = $status;

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

    public function getEntity(): ?string
    {
        return $this->entity;
    }

    public function setEntity(string $entity): self
    {
        $this->entity = $entity;

        return $this;
    }

    public function getItemID(): ?int
    {
        return $this->itemID;
    }

    public function setItemID(int $itemID): self
    {
        $this->itemID = $itemID;

        return $this;
    }

}
