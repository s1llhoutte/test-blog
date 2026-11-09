{include file="layouts/header.tpl"}

<section class="home">
    <div class="home__hero">
        <span class="home__label">Добро пожаловать</span>
        <h1>Место для интересных идей и полезных знаний</h1>
        <p>
            Читайте статьи о программировании, веб-разработке,
            базах данных и инструментах для разработчиков.
        </p>
    </div>

    <section class="categories">
        <div class="section-heading">
            <div>
                <span class="section-heading__label">Навигация</span>
                <h2>Категории</h2>
            </div>
        </div>

        {if $categories}
            <div class="categories__grid">
                {foreach $categories as $category}
                    <article class="category">
                        <h3>
                            <a href="/?page=category&id={$category.id}">
                                {$category.name|escape}
                            </a>
                        </h3>
                        <p>{$category.description|escape}</p>
                    </article>
                {/foreach}
            </div>
        {else}
            <p>Категории пока не добавлены.</p>
        {/if}
    </section>

    <section class="posts">
        <div class="section-heading">
            <div>
                <span class="section-heading__label">Блог</span>
                <h2>Последние статьи</h2>
            </div>
        </div>

        {if $posts}
            <div class="posts__grid">
                {foreach $posts as $post}
                    <article class="post">
                        {if $post.image}
                            <div class="post__image">
                                <img
                                    src="{$post.image|escape}"
                                    alt="{$post.name|escape}"
                                >
                            </div>
                        {/if}

                        <div class="post__content">
                            <h3>
                                <a href="/?page=post&id={$post.id}">
                                    {$post.name|escape}
                                </a>
                            </h3>
                            <p>{$post.description|escape}</p>

                            <div class="post__meta">
                                <span>
                                    <span class="post__meta-icon">◉</span>
                                    {$post.views} просмотров
                                </span>
                            </div>
                        </div>
                    </article>
                {/foreach}
            </div>
        {else}
            <p>Статей пока нет.</p>
        {/if}
    </section>
</section>

{include file="layouts/footer.tpl"}