# Ćwiczenie 5 - Podstawowe środowisko deweloperskie
Na koniec zajmiemy się prostym środowiskiem deweloperskim, które będzie się składać z:
* Framework Laravel
* bazy danych MySQL
* serwera nginx z PHP

Na hoście nie zostanie zainstalowane PHP i composer. Wszystko będzie odbywało się przez kontenery.

## Pobranie Framework Laravel
```
curl -L https://github.com/laravel/laravel/archive/v5.5.0.tar.gz | tar xz
```
```
mv laravel-5.5.0 szkolenie
```

## Instalacja zależności
```
docker run --rm -v $(pwd):/app composer/composer install
```

## Przygotowanie pliku konfiguracyjnego docker-compose 
```
touch docker-compose.yaml
```

### PHP
```
version: '2'
services:
  app:
    build:
      context: ./
      dockerfile: app.dockerfile
    working_dir: /var/www
    volumes:
      - ./:/var/www
    environment:
      - "DB_PORT=3306"
      - "DB_HOST=database"
```

#### app.dockerfile
Oparty na bitnami/php-fpm. Szczegóły w repo.

### NGINX
```
web:
  build:
    context: ./
    dockerfile: web.dockerfile
  working_dir: /var/www
  volumes_from:
    - app
  ports:
    - 8080:80
```
#### web.dockerfile
Oparty na standardowym obrazie nginx. Szczegóły w repo.

#### vhost.conf
Również w repo...

### MySQL
```
  database:
    image: mysql:5.6
    volumes:
      - dbdata:/var/lib/mysql
    environment:
      - "MYSQL_DATABASE=homestead"
      - "MYSQL_USER=homestead"
      - "MYSQL_PASSWORD=secret"
      - "MYSQL_ROOT_PASSWORD=secret"
    ports:
        - "33061:3306"
volumes:
  dbdata:
```

## Wystartowanie środowiska
```
docker-compose up
```

## Końcowa konfiguracja

1. Ustawienie pliku .env
```
mv .env.example .env
```

2. Wygenerowanie klucza aplikacji i optymalizacja
```
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan optimize
```

Powyższy sposób można wykorzystać do:
```
docker-compose exec app php artisan migrate --seed
docker-compose exec app php artisan make:controller MyController
```

3. Zmiana praw dostępu do katalogu logów
```
docker-compose exec app php artisan cache:clear 
chmod -R 777 storage/
```
