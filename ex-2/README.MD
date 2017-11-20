# Ćwiczenie 2 - Podstawowe komendy
Ćwiczenie ma na celu zaznajomienie się z Dockerem i "czarno ekranowe" manipulacje

## Sprawdzenie wersji
```
docker version
```

## Uruchomienie pierwszego kontenera
```
docker run busybox
```
```
docker run busybox echo "ala ma kota" #uruchomienie maszyny i wykonanie na niej operacji
```

## Lista ściągniętych i dostępnych lokalnie obrazów
```
docker images
```
```
docker images -q #tylko identyfikatory (hashe) obrazów
```

Więcej informacji [tutaj](https://docs.docker.com/engine/reference/commandline/images/)


## Usunięcie obrazu lokalnie 
```
docker rmi <nazwa_obrazu>
```
```
docker rmi <nazwa_obrazu> --force
```
```
docker rmi $(docker images -q) #usunięcie wszystkich obrazów lokalnie
```

Więcej informacji [tutaj](https://docs.docker.com/engine/reference/commandline/rmi/)

## Uruchomienie kontenera "lepszego"
```
docker run nginx
```

## Sprawdzenie wszystkich działających na maszynie kontenerów
```
docker ps
```

Więcej informacji [tutaj](https://docs.docker.com/engine/reference/commandline/ps/)


## Zabicie kontenera 
```
docker rm <nazwa_kontener lub id>
```
```
docker rm <nazwa_kontenera lub id> --force #z wymuszeniem zamknięcia
```
```
docker rm $(docker ps -q) --force #zabicie wszystkich uruchomionych kontenerów
```

Więcej informacji [tutaj](https://docs.docker.com/engine/reference/commandline/rm/)

## Uruchomienie kontenera raz jeszcze
```
docker run nginx
```
```
docker run -p 80:80 nginx #połączenie portu hosta z wystawionym przez kontener portem
```
```
docker run -it busybox /bin/sh #uruchomienie kontenera z interaktywną konsolą
```

Więcej informacji [tutaj](https://docs.docker.com/engine/reference/run/)

## Wykonanie polecenia na uruchomionej maszynie

```
docker run --name moje_ubuntu --rm -i -t ubuntu bash
```
```
docker exec -d moje_ubuntu touch /tmp/test
```
```
docker exec -it moje_ubuntu bash
```
```
docker exec -it -e VAR=1 ubuntu_bash bash
```

Więcej informacji [tutaj](https://docs.docker.com/engine/reference/commandline/exec/)

## Startowanie i kończenie pracy kontenera
``` 
docker start <id>
```
```
docker stop <id>