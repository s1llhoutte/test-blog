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

{include file="layouts/footer.tpl"}