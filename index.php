<?php

require_once __DIR__ . '/vendor/autoload.php';

$smarty = new Smarty\Smarty();

$smarty->setTemplateDir(__DIR__ . '/templates');
$smarty->setCompileDir(__DIR__ . '/storage/smarty/compiled');

$smarty->assign('site_name', 'Test Blog');

$smarty->display('pages/home.tpl');