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

{if $similarPosts}
    <section class="similar-posts">
        <div class="section-heading">
            <div>
                <span class="section-heading__label">Читайте также</span>
                <h2>Похожие статьи</h2>
            </div>
        </div>

        <div class="posts__grid">
            {foreach $similarPosts as $similarPost}
                <article class="post">
                    {if $similarPost.image}
                        <div class="post__image">
                            <img
                                src="{$similarPost.image|escape}"
                                alt="{$similarPost.name|escape}"
                            >
                        </div>
                    {/if}

                    <div class="post__content">
                        <h3>
                            <a href="/?page=post&id={$similarPost.id}">
                                {$similarPost.name|escape}
                            </a>
                        </h3>

                        <p>{$similarPost.description|escape}</p>

                        <div class="post__meta">
                            {$similarPost.views} просмотров
                        </div>
                    </div>
                </article>
            {/foreach}
        </div>
    </section>
{/if}

{include file="layouts/footer.tpl"}