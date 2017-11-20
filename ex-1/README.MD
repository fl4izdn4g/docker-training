# Ćwiczenie 1 - Instalacja Docker

Szczegółowy opis instalacji dla systemu Ubuntu znajduje się [tutaj](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu)

## Przygotowanie repozytorium
```
sudo apt update
```
```
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
```
```
​curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -​
```
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

## Instalacja 
```
sudo apt update​
```
```
sudo apt install docker-ce​
```

## Po instalacji
```
sudo groupadd docker​
```
```
sudo usermod -aG docker $USER​
```
```
sudo systemctl enable docker​ #włączenie Docker, aby działał po restarcie
```
```
reboot
```