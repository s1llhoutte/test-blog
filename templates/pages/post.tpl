{include file="layouts/header.tpl"}

<article class="post-page">
    {if $post.image}
        <div class="post-page__image">
            <img
                src="{$post.image|escape}"
                alt="{$post.name|escape}"
            >
        </div>
    {/if}

    <div class="post-page__content">
        <h1>{$post.name|escape}</h1>

        <p class="post-page__description">
            {$post.description|escape}
        </p>

        <div class="post-page__meta">
            <span>Дата публикации: {$post.created_at|date_format:"%d.%m.%Y"}</span>
            <span>Просмотров: {$post.views}</span>
        </div>

        <div class="post-page__text">
            {$post.text|escape|nl2br}
        </div>

        <a href="/" class="post-page__back">
            Вернуться на главную
        </a>
    </div>
</article>

{include file="layouts/footer.tpl"}