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

if ($page === 'post') {
    $postId = (int) ($_GET['id'] ?? 0);

    $post = $postModel->getById($postId);

    if (!$post) {
        http_response_code(404);
        exit('Статья не найдена');
    }

    $postModel->incrementViews($postId);
    $post['views']++;

    $similarPosts = $postModel->getSimilar($postId, 3);

    $smarty->assign('post', $post);
    $smarty->assign('similarPosts', $similarPosts);

    $smarty->display('pages/post.tpl');
    exit;
}

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

    $perPage = 3;
    $totalPosts = $categoryModel->getPostsCount($categoryId);
    $totalPages = (int) ceil($totalPosts / $perPage);

    $currentPage = max(1, (int) ($_GET['page_number'] ?? 1));

    if ($totalPages > 0) {
        $currentPage = min($currentPage, $totalPages);
    }

    $offset = ($currentPage - 1) * $perPage;

    $posts = $categoryModel->getPostsPaginated(
        $categoryId,
        $sort,
        $perPage,
        $offset
    );

    $smarty->assign('category', $category);
    $smarty->assign('posts', $posts);
    $smarty->assign('sort', $sort);
    $smarty->assign('currentPage', $currentPage);
    $smarty->assign('totalPages', $totalPages);

    $smarty->display('pages/category.tpl');
    exit;
}

$categories = $categoryModel->getAll();

$categoriesWithPosts = [];

foreach ($categories as $category) {
    $posts = $categoryModel->getLatestPosts($category['id']);

    if (!$posts) {
        continue;
    }

    $category['posts'] = $posts;
    $categoriesWithPosts[] = $category;
}

$smarty->assign('categories', $categoriesWithPosts);

$smarty->display('pages/home.tpl');