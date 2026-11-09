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

    public function getSimilar(int $postId, int $limit = 3): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT posts.*, COUNT(*) AS shared_categories
            FROM post_category AS current_category
            INNER JOIN post_category AS similar_category
                ON similar_category.category_id = current_category.category_id
            INNER JOIN posts
                ON posts.id = similar_category.post_id
            WHERE current_category.post_id = :current_post_id
                AND similar_category.post_id != :excluded_post_id
            GROUP BY posts.id
            ORDER BY shared_categories DESC, posts.created_at DESC
            LIMIT :limit'
        );

        $stmt->bindValue(':current_post_id', $postId, PDO::PARAM_INT);
        $stmt->bindValue(':excluded_post_id', $postId, PDO::PARAM_INT);
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);

        $stmt->execute();

        return $stmt->fetchAll();
    }
}