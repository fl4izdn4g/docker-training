# Ćwiczenie 3 - Tworzenie obrazów
Za pomocą Dockera można budować własne obrazy w oparciu o bazowe obrazy dostępne w Docker Hub stworzone przez innych użytkowników. Strukturę własnego obrazy umieszcza się w plikach o nazwie ```Dockerfile```.
Pliki ten opisuje poszczególne warstwy z jakich składa się budowany obraz. Warstwa to linia w pliku. 

Więcej informacji na temat tworzenia własnych obrazów można znaleźć [tutaj](https://docs.docker.com/engine/reference/builder/)

Przzykładowy plik Dockerfile wygląda tak:
```
FROM microsoft/nanoserver
COPY testfile.txt c:\
RUN dir c:\
```

## Budowanie obrazu
```
docker build -t <nazwa_obrazu> .
```

## Składowe Dockerfile

### FROM
```
FROM <nazwa obrazu bazowego>
```
Inicjalizacja budowania obrazu na podstawie obrazu bazowego. Od takiej linii musi rozpocząć się każdy ```Dockerfile```.

### RUN
```
RUN <komenda>
```

### COPY
```
COPY <sciezka_hosta> <sciezka_obrazu>
```

### WORKDIR
```
WORKDIR <sciezka bbazowa w obrazie>
```

### CMD
```
CMD <komenda do wykonaia> <parametry>
```

```
CMD ["<komenda>", "<parametr1>", "<parametr2>"]
```
