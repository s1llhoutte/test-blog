{include file="layouts/header.tpl"}

<section class="category-page">
    <h1>{$category.name|escape}</h1>

    <p>{$category.description|escape}</p>

    <div class="posts">
        <div class="category-page__heading">
            <h2>Статьи категории</h2>

            <div class="category-page__sorting">
                <span>Сортировка:</span>
                <a
                    href="/?page=category&id={$category.id}&sort=date"
                    class="{if $sort === 'date'}active{/if}"
                >
                    По дате
                </a>

                <a
                    href="/?page=category&id={$category.id}&sort=views"
                    class="{if $sort === 'views'}active{/if}"
                >
                    По просмотрам
                </a>
            </div>
        </div>

        {if $posts}
            {foreach $posts as $post}
                <article class="post">
                    {if $post.image}
                        <a href="/?page=post&id={$post.id}" class="post__image">
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
                            {$post.views} просмотров
                        </div>
                    </div>
                </article>
            {/foreach}
        {else}
            <p>В этой категории пока нет статей.</p>
        {/if}
    </div>
</section>

{if $totalPages > 1}
    <nav class="pagination">
        {if $currentPage > 1}
            <a href="/?page=category&id={$category.id}&sort={$sort}&page_number={$currentPage - 1}">
                Назад
            </a>
        {/if}

        {for $pageNumber = 1 to $totalPages}
            <a
                href="/?page=category&id={$category.id}&sort={$sort}&page_number={$pageNumber}"
                class="{if $pageNumber === $currentPage}active{/if}"
            >
                {$pageNumber}
            </a>
        {/for}

        {if $currentPage < $totalPages}
            <a href="/?page=category&id={$category.id}&sort={$sort}&page_number={$currentPage + 1}">
                Далее
            </a>
        {/if}
    </nav>
{/if}

{include file="layouts/footer.tpl"}