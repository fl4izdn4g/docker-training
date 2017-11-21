# Ćwiczenie 4 - Budowanie środowiska
Budowanie i uruchamianie pojedynczych kontenerów jest bardzo czasochłonne, dlatego też powstało narzędzie docker-compose. Pozwala ono, za pomocą odpowiedniego pliku konfiguracyjnego uruchomić zestaw skonfigurowanych kontenerów, które będą tworzyły środowisko deweloperskie.

## Instalacja docker-compose
Przy instalacji należy zwrócić na pobieraną wersję. Najnowszą wersję polecenia można znaleźć pod adresem:
[https://github.com/docker/compose/releases](https://github.com/docker/compose/releases)

```
sudo curl -L https://github.com/docker/compose/releases/download/1.17.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```
```
sudo chmod +x /usr/local/bin/docker-compose
```
```
docker-compose --version
```

## Wystartowanie środowiska
```
docker-compose up
```
```
docker-compose up --build
```

**Tę komendę można wykonać tylko w katalogu, w którym znajduje się plik docker-compose.yaml**

## Plik docker-compose.yaml
Plik konfiguracyjny środowisko. W formacie YAML. Szczegółowe informacje odnośnie tworzenia takiego pliku można znaleźć [tutaj](https://docs.docker.com/compose/overview/#compose-documentation)

## Przykładowy plik konfiguracyjny
Środowisko do poprzedniego przykładu
```
version: '3'
services:
  web:
    build: .
    ports:
     - "5000:5000"
    volumes:
     - .:/code
  redis:
    image: "redis:alpine"
```

Środowisko Wordpress z bazą MySQL
```
version: '3'

services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress

   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8000:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
volumes:
    db_data:
```

