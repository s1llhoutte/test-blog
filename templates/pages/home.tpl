{include file="layouts/header.tpl"}

<section class="home">
    <h1>Добро пожаловать в {$site_name}!</h1>

    <div class="categories">
        <h2>Категории</h2>

        {if $categories}
            {foreach $categories as $category}
                <article class="category">
                    <h3>{$category.name|escape}</h3>
                    <p>{$category.description|escape}</p>
                </article>
            {/foreach}
        {else}
            <p>Категории пока не добавлены.</p>
        {/if}
    </div>
</section>

<section class="posts">
    <h2>Последние статьи</h2>

    {if $posts}
        {foreach $posts as $post}
            <article class="post">
                {if $post.image}
                    <img src="{$post.image|escape}" alt="{$post.name|escape}">
                {/if}

                <h3>{$post.name|escape}</h3>
                <p>{$post.description|escape}</p>
                <span>Просмотров: {$post.views}</span>
            </article>
        {/foreach}
    {else}
        <p>Статей пока нет.</p>
    {/if}
</section>

{include file="layouts/footer.tpl"}