<?php

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/app/Models/Category.php';
require_once __DIR__ . '/app/Models/Post.php';

$pdo = require __DIR__ . '/config/database.php';

$smarty = new Smarty\Smarty();

$smarty->setTemplateDir(__DIR__ . '/templates');
$smarty->setCompileDir(__DIR__ . '/storage/smarty/compiled');

$categoryModel = new Category($pdo);
$postModel = new Post($pdo);

$smarty->assign('site_name', 'Test Blog');

$page = $_GET['page'] ?? 'home';

if ($page === 'category') {
    $categoryId = (int) ($_GET['id'] ?? 0);

    $category = $categoryModel->getById($categoryId);

    if (!$category) {
        http_response_code(404);
        exit('Категория не найдена');
    }

    $sort = $_GET['sort'] ?? 'date';
    if (!in_array($sort, ['date', 'views'], true)) {
        $sort = 'date';
    }

    $smarty->assign('category', $category);
    $smarty->assign('posts', $categoryModel->getPosts($categoryId, $sort));
    $smarty->assign('sort', $sort);

    $smarty->display('pages/category.tpl');
    exit;
}

$smarty->assign('categories', $categoryModel->getAll());
$smarty->assign('posts', $postModel->getAll());

$smarty->display('pages/home.tpl');