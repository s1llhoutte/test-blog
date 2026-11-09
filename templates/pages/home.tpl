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
        {if $categories}
            {foreach $categories as $category}
                <section class="category-section">
                    <div class="section-heading">
                        <div>
                            <span class="section-heading__label">Категория</span>
                            <h2>{$category.name|escape}</h2>
                        </div>

                        <a
                            href="/?page=category&id={$category.id}"
                            class="category-section__all"
                        >
                            Все статьи
                        </a>
                    </div>

                    {if $category.description}
                        <p class="category-section__description">
                            {$category.description|escape}
                        </p>
                    {/if}

                    <div class="posts__grid">
                        {foreach $category.posts as $post}
                            <article class="post">
                                {if $post.image}
                                    <a
                                        href="/?page=post&id={$post.id}"
                                        class="post__image"
                                    >
                                        <img
                                            src="{$post.image|escape}"
                                            alt="{$post.name|escape}"
                                        >
                                    </a>
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
                </section>
            {/foreach}
        {else}
            <p>Пока нет категорий со статьями.</p>
        {/if}
    </section>
</section>

{include file="layouts/footer.tpl"}