# Test Blog

Тестовый проект блога на PHP 8.3, Smarty и MySQL 8.0.

## Требования

- Docker
- Docker Compose
- Node.js и npm (для компиляции SCSS)

## Установка и запуск

1. Клонировать репозиторий:

   ```bash
   git clone https://github.com/s1llhoutte/test-blog.git
   cd test-blog
   ```

2. Собрать и запустить Docker-контейнеры:

   ```bash
   docker compose up -d --build
   ```

3. Установить PHP-зависимости:

   ```bash
   docker compose exec app composer install
   ```

4. Скомпилировать SCSS:

   ```bash
   npm install
   npm run scss
   ```

5. Открыть проект в браузере:

   http://localhost:8080

При первом запуске MySQL автоматически создаёт базу данных, таблицы и заполняет их тестовыми данными из SQL-файлов в папке `database`.

## База данных

- Database: `test_blog`
- Host: `db`
- Port: `3306`
- Username: `test_blog`
- Password: `test_blog`

Для подключения с локального компьютера используется порт `3307`.

## Используемые технологии

- PHP 8.3
- Smarty
- MySQL 8.0
- Docker
- Composer
- SCSS
