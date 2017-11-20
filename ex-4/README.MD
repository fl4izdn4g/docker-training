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
Plik konfiguracyjny środowisko. W formacie YAML. 