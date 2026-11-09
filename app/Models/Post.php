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

    public function getById(int $id): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM posts WHERE id = :id'
        );

        $stmt->execute(['id' => $id]);

        $post = $stmt->fetch();

        return $post ?: null;
    }

    public function incrementViews(int $id): void
    {
        $stmt = $this->pdo->prepare(
            'UPDATE posts SET views = views + 1 WHERE id = :id'
        );

        $stmt->execute(['id' => $id]);
    }
}
