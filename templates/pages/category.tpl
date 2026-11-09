{include file="layouts/header.tpl"}

<section class="category-page">
    <h1>{$category.name|escape}</h1>

    <p>{$category.description|escape}</p>

    <div class="posts">
        <h2>Статьи категории</h2>

        {if $posts}
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
                        <h3>{$post.name|escape}</h3>
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

{include file="layouts/footer.tpl"}