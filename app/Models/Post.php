<?php

class Post
{
    public function __construct(
        private PDO $pdo
    ) {
    }

    public function getAll(): array
    {
        $stmt = $this->pdo->query(
            'SELECT * FROM posts ORDER BY created_at DESC'
        );

        return $stmt->fetchAll();
    }
}