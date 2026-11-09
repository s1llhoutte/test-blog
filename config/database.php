<?php

$host = 'db';
$dbname = 'test_blog';
$username = 'test_blog';
$password = 'test_blog';

$dsn = "mysql:host={$host};dbname={$dbname};charset=utf8mb4";

$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];

return new PDO($dsn, $username, $password, $options);