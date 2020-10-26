<?php


class MapperDevice
{
    /**
     * @var ObjectDevice $device
     */
    private $device;

    /**
     * @return ObjectDevice
     */
    public function getDevice(): ObjectDevice
    {
        return $this->device;
    }

    public function setDevice($model, $cpu, $ram, $price, $description, $status,
                              $createdBy, $battery): void
    {
        $this->device = new ObjectDevice();

        $this->device->setModel($model);
        $this->device->setCpu($cpu);
        $this->device->setRam($ram);
        $this->device->setPrice($price);
        $this->device->setDescription($description);
        $this->device->setStatus($status);
        $this->device->setCreatedBy($createdBy);
        $this->device->setBattery($battery);
    }

    public function getDeviceAsArray(): array
    {
        return [
            "model"=>$this->device->getModel(),
            "cpu"=>$this->device->getCpu(),
            "ram"=>$this->device->getRam(),
            "price"=>$this->device->getPrice(),
            "description"=>$this->device->getDescription(),
            "status"=>$this->device->getStatus(),
            "createdBy"=>$this->device->getCreatedBy(),
            "battery"=>$this->device->getBattery(),
        ];
    }
}