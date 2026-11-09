<?php

require_once __DIR__ . '/vendor/autoload.php';
require_once __DIR__ . '/app/Models/Category.php';

$pdo = require __DIR__ . '/config/database.php';

$smarty = new Smarty\Smarty();

$smarty->setTemplateDir(__DIR__ . '/templates');
$smarty->setCompileDir(__DIR__ . '/storage/smarty/compiled');

$categoryModel = new Category($pdo);

$smarty->assign('site_name', 'Test Blog');
$smarty->assign('categories', $categoryModel->getAll());

$smarty->display('pages/home.tpl');