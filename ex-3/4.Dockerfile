FROM php:7.0-cli
COPY . /usr/src/apka
WORKDIR /usr/src/apka
CMD [ "php", "./app.php" ]`