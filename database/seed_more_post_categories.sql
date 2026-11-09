INSERT INTO post_category (post_id, category_id)
SELECT posts.id, mapping.category_id
FROM (
    SELECT 'Что такое Laravel и почему его выбирают?' AS post_name, 1 AS category_id
    UNION ALL SELECT 'Основы объектно-ориентированного программирования', 1
    UNION ALL SELECT 'Как работает JavaScript в браузере?', 2
    UNION ALL SELECT 'Что такое REST API?', 2
    UNION ALL SELECT 'Индексы MySQL: зачем они нужны?', 3
    UNION ALL SELECT 'Как правильно использовать Git?', 4
    UNION ALL SELECT 'CSS Flexbox: практическое руководство', 2
    UNION ALL SELECT 'Что такое Docker и зачем он разработчику?', 4
    UNION ALL SELECT 'Оптимизация скорости загрузки сайта', 4
    UNION ALL SELECT 'Работа с формами в PHP', 1
    UNION ALL SELECT 'SCSS: переменные, вложенность и миксины', 2
    UNION ALL SELECT 'Безопасность веб-приложений', 4
) AS mapping
INNER JOIN posts ON posts.name = mapping.post_name;