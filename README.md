# Sprawozdanie 3

<b>Skrypt z zadania 5Z1</b>
- Potwierdzenie poprawnego wykonania skryptu:<br />
![5Z1_dziala](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z1_dziala.png)<br />
- potwierzdenie uruchomienia wszystkich kontenerów: ```docker ps -a```<br />
![5Z1_container](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z1_container.png)<br />
- potwierzdenie stworzenia wszystkich sieci: ``` docker network ls```<br />
![5Z1_network](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z1_network.png)<br />
- Komendą ```docker inspect <nazwa_kontenera> | jq '.[].NetworkSettings.Networks'``` można sprawdzić, do jakich sieci przyłączony jest kontener. Np. kontener T2 przyłączony jest do podsieci bridge oraz bridge1:
![5Z1_przylaczone_kontenery](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z1_przylaczone_kontenery.png)<br />
