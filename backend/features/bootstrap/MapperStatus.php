<?php


class MapperStatus
{
    /**
     * @var ObjectStatus $status
     */
    private $status;

    /**
     * @return ObjectStatus
     */
    public function getStatus(): ObjectStatus
    {
        return $this->status;
    }

    public function setStatus($status, $userID, $LawyerID): void
    {
        $this->status = new ObjectStatus();

        $this->status->setUserID($userID);
        $this->status->setLawyerID($LawyerID);
        $this->status->setStatus($status);
    }

    public function getStatusAsArray(): array
    {
        return [
            "userID"=>$this->status->getUserID(),
            "LawyerID"=>$this->status->getLawyerID(),
            "status"=>$this->status->getStatus()
        ];
    }
}