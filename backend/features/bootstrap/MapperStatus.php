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

    public function setStatus($status, $lawyerID): void
    {
        $this->status = new ObjectStatus();

        $this->status->setLawyerID($lawyerID);
        $this->status->setStatus($status);
    }

    public function getStatusAsArray(): array
    {
        return [
            "lawyerID"=>$this->status->getLawyerID(),
            "status"=>$this->status->getStatus()
        ];
    }
}