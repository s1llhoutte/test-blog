<?php

class Category
{
    public function __construct(
        private PDO $pdo
    ) {
    }

    public function getAll(): array
    {
        $stmt = $this->pdo->query(
            'SELECT * FROM categories ORDER BY created_at DESC'
        );

        return $stmt->fetchAll();
    }

    public function getById(int $id): ?array
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM categories WHERE id = :id'
        );

        $stmt->execute(['id' => $id]);

        $category = $stmt->fetch();

        return $category ?: null;
    }

    public function getPosts(int $categoryId, string $sort = 'date'): array
    {
        $orderBy = match ($sort) {
            'views' => 'posts.views DESC',
            default => 'posts.created_at DESC',
        };

        $stmt = $this->pdo->prepare(
            "SELECT posts.*
            FROM posts
            INNER JOIN post_category ON posts.id = post_category.post_id
            WHERE post_category.category_id = :category_id
            ORDER BY {$orderBy}"
        );

        $stmt->execute(['category_id' => $categoryId]);

        return $stmt->fetchAll();
    }

    public function getPostsCount(int $categoryId): int
    {
        $stmt = $this->pdo->prepare(
            'SELECT COUNT(*)
            FROM post_category
            WHERE category_id = :category_id'
        );

        $stmt->execute(['category_id' => $categoryId]);

        return (int) $stmt->fetchColumn();
    }

    public function getPostsPaginated(
        int $categoryId,
        string $sort,
        int $limit,
        int $offset
    ): array {
        $orderBy = match ($sort) {
            'views' => 'posts.views DESC',
            default => 'posts.created_at DESC',
        };

        $stmt = $this->pdo->prepare(
            "SELECT posts.*
            FROM posts
            INNER JOIN post_category ON posts.id = post_category.post_id
            WHERE post_category.category_id = :category_id
            ORDER BY {$orderBy}
            LIMIT :limit OFFSET :offset"
        );

        $stmt->bindValue(':category_id', $categoryId, PDO::PARAM_INT);
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);

        $stmt->execute();

        return $stmt->fetchAll();
    }

    public function getLatestPosts(int $categoryId, int $limit = 3): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT posts.*
            FROM posts
            INNER JOIN post_category ON posts.id = post_category.post_id
            WHERE post_category.category_id = :category_id
            ORDER BY posts.created_at DESC
            LIMIT :limit'
        );

        $stmt->bindValue(':category_id', $categoryId, PDO::PARAM_INT);
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);

        $stmt->execute();

        return $stmt->fetchAll();
    }
}