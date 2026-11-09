<?php

require_once __DIR__ . '/vendor/autoload.php';

$smarty = new Smarty\Smarty();

$smarty->setTemplateDir(__DIR__ . '/templates');
$smarty->setCompileDir(__DIR__ . '/storage/smarty/compiled');

$smarty->assign('title', 'Test Blog');
$smarty->assign('description', 'Smarty is working correctly!');

$smarty->display('test.tpl');