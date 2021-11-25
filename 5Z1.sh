#!/bin/sh

#uruchomienie kontenera T1
docker run -itd --name T1 alpine

#stworzenie sieci bridge1 z odpowiednią deklaracją adresacji podsieci
docker network create -d bridge --subnet 10.0.10.0/24 bridge1

#uruchomienie kontenera T2 wraz z mapowaniem odpowiednich portów
docker run -td --name T2 -p 80:80 -p 10.0.10.0:8000:80 nginx

#podłączenie kontenera T2 do sieci bridge1
docker network connect bridge1 T2

#uruchomienie kontenera D1 podłączając go do sieci bridge1
docker run -itd --name D1 --net bridge1 --ip 10.0.10.254 alpine

#stworzenie sieci bridge 2 z odpowiednia deklaracją adresacji podsieci
docker network create -d bridge --subnet 10.0.2.0/24 bridge2

#uruchomienie kontenera S1 podłączając go do sieci bridge2 
docker run -itd --net bridge2 --name S1 ubuntu

#uruchomienie kontenera D2 podlaczajac go do sieci bridge1, wraz z mapowaniem odpowiednich portów
docker run -itd --net bridge1 --name D2 -p 10.0.10.0:8080:80 -p 10.0.2.0:8081:80 httpd

#podłączenie kontenera D2 do sieci bridge2
docker network connect bridge2 D2
