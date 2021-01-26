<?php


namespace App\Service;


use App\AutoMapping;
use App\Entity\ImageEntity;
use App\Manager\ImageManager;
use App\Response\ImageResponse;
use App\Response\ImageCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ImageService
{
    private $autoMapping;
    private $imageManager;
    private $params;

    public function __construct(AutoMapping $autoMapping, ImageManager $imageManager, ParameterBagInterface $params)
    {
        $this->autoMapping = $autoMapping;
        $this->imageManager = $imageManager;
        $this->params = $params->get('upload_base_url').'/';;
    }

    public function imageCreate($request)
    {
        $imageCreate = $this->imageManager->imageCreate($request);

        $imageCreate->setImage($this->specialLinkCheck($imageCreate->getSpecialLink()).$imageCreate->getImage());

        return $this->autoMapping->map(ImageEntity::class,ImageCreateResponse::class, $imageCreate);
    }

    public function getImages($id, $entity)
    {
        $imagesResponse = [];

        $images = $this->imageManager->getImages($id, $entity);

        foreach ($images as $image)
        {
            $image['image']= $this->specialLinkCheck($image['specialLink']).$image['image'];
            $imagesResponse[] = $this->autoMapping->map('array', ImageResponse::class, $image);
        }

        return $imagesResponse;
    }

    public function specialLinkCheck($bool)
    {
        if ($bool == false)
        {
            return $this->params;
        }
    }
}