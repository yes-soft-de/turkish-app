<?php

namespace App\Entity;

use App\Repository\MessageEntityRepository;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=MessageEntityRepository::class)
 */
class MessageEntity
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
    private $userOne;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $userTwo;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $status = "On going";

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $roomID;

    /**
     * @Gedmo\Timestampable(on="create")
     * @ORM\Column(type="datetime")
     */
    private $createdAt;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUserOne(): ?string
    {
        return $this->userOne;
    }

    public function setUserOne(string $userOne): self
    {
        $this->userOne = $userOne;

        return $this;
    }

    public function getUserTwo(): ?string
    {
        return $this->userTwo;
    }

    public function setUserTwo(string $userTwo): self
    {
        $this->userTwo = $userTwo;

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

    public function getRoomID(): ?string
    {
        return $this->roomID;
    }

    public function setRoomID(string $roomID): self
    {
        $this->roomID = $roomID;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }
}
