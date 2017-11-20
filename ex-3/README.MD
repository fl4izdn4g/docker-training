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
```
RUN ["<komenda>","<parametr1>","<parametr2"]
```
Polecenie pozwala na wykonanie dowolnej komendy w nowej warstwie obrazu w środowisku utworzonym po poprzedniej warstwie. Nowa warstwa utworzona przez **RUN** może być wykorzystana dalej.

### COPY
```
COPY <sciezka_hosta> <sciezka_obrazu>
```
Kopiuje pliki z hosta do kontenera

### WORKDIR
```
WORKDIR <sciezka bbazowa w obrazie>
```
Ustawia ścieżkę bazową dla komend, które następują po tym poleceniu, np. RUN, CMD, COPY

### CMD
```
CMD <komenda do wykonaia> <parametry>
```
```
CMD ["<komenda>", "<parametr1>", "<parametr2>"]
```
Definiuje **domyślną** komendę jaka będzie wykonana po utworzeniu obrazu. Nie bierze ona udziału w tworzeniu obrazu. Można wstawiać wiele CMD, ale wykorzystana będzie wyłącznie ostatnia.

### ENTRYPOINT
```
ENTRYPOINT ["<polecenie>", "<parametr1>", "<parametr2>"]
ENTRYPOINT <polecenie> <parametr1> <parametr2>
```
Definiuje komendę jaka ma być uruchomiona po utworzeniu kontenera. Nie jest to samo co **CMD**. Dzięki tej komendzie można traktować obraz jako plik wykonywalny. Jakby uruchamiało się program .exe.

### EXPOSE
```
EXPOSE <port_kontenera>
```
Udostępnia/otwiera port kontenera.

### VOLUME
```
VOLUME ["<sciezka_do_udostepnienia>"]
```
Umożliwia utworzenie w kontenerze punktu podłączenia (mounnt point) plików. Takie udostępnianie zasobów.

### ENV
```
ENV <nazwa>=<wartosc>
```
```
ENV <nazwa> <wartosc>
```
Ustawienie zmiennych środowiskowych.

## Wystawianie na zewnątrz

```
docker build -t <nazwa_lokalna_obrazu> .
```
```
docker tag <nazwa_lokalna> <nazwa_zdalna>
```
```
docker login
```
```
docker push <nazwa_zdalna>
```

***Polecenie ```docker login``` służy do zalogowania się w serwisie DockerHub, gdzie zostanie wypchnięty obraz.