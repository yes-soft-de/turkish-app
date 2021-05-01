<?php

namespace App\Service;

use App\AutoMapping;
use App\Entity\CategoryEntity;
use App\Manager\CategoryManager;
use App\Response\CategoryCreateResponse;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class CategoryService
{
    private $categoryManager;
    private $autoMapping;
    private $params;

    public function __construct(CategoryManager $categoryManager, AutoMapping $autoMapping, ParameterBagInterface $params)
    {
        $this->categoryManager =$categoryManager;
        $this->autoMapping = $autoMapping;
        $this->params = $params->get('upload_base_url') . '/';
    }

    public function create($request)
    {  
        $categoryResult = $this->categoryManager->create($request);

        return $this->autoMapping->map(CategoryEntity::class, CategoryCreateResponse::class, $categoryResult);
    }
    
    public function getAll()
    {
        $response = [];

        $result = $this->categoryManager->getAll();

        foreach ($result as $row)
        {
            $response[] = $this->autoMapping->map('array', CategoryCreateResponse::class, $row);
        }

        return $response;
    }

    public function getCategoryById($id)
    {
        $response = [];

        $result = $this->categoryManager->getCategoryById($id);

        foreach ($result as $row)
        {
            $response = $this->autoMapping->map('array', CategoryCreateResponse::class, $row);
        }

        return $response;
    }

    public function delete($id)
    {
        $result = $this->categoryManager->delete($id);

        if(!($result instanceof CategoryEntity))
        {
            return $result;
        }

        return $this->autoMapping->map(CategoryEntity::class, CategoryCreateResponse::class, $result);
    }

    public function update($request)
    {
        $categoryResult = $this->categoryManager->update($request);

        return $this->autoMapping->map(CategoryEntity::class, CategoryCreateResponse::class, $categoryResult);
    }

    // public function getCategoriesArray($categories)
    // {
    //     return $this->categoryManager->getCategoriesArray($categories);
    // }
}