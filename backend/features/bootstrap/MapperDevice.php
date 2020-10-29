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

    public function setDevice($brand, $cpu, $ram, $price, $description, $status,
                              $battery, $gauge, $location, $durationOfUse, $image): void
    {
        $this->device = new ObjectDevice();

        $this->device->setBrand($brand);
        $this->device->setCpu($cpu);
        $this->device->setRam($ram);
        $this->device->setPrice($price);
        $this->device->setDescription($description);
        $this->device->setStatus($status);
        $this->device->setBattery($battery);
        $this->device->setGauge($gauge);
        $this->device->setLocation($location);
        $this->device->setDurationOfUse($durationOfUse);
        $this->device->setImage($image);
    }

    public function getDeviceAsArray(): array
    {
        return [
            "brand"=>$this->device->getBrand(),
            "cpu"=>$this->device->getCpu(),
            "ram"=>$this->device->getRam(),
            "price"=>$this->device->getPrice(),
            "description"=>$this->device->getDescription(),
            "status"=>$this->device->getStatus(),
            "battery"=>$this->device->getBattery(),
            "gauge"=>$this->device->getGauge(),
            "location"=>$this->device->getLocation(),
            "durationOfUse"=>$this->device->getDurationOfUse(),
            "image"=>$this->device->getImage(),
        ];
    }
}