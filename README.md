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


<b>Skrypt z zadania 5Z3</b>
- Potwierdzenie poprawnego wykonania skryptu:<br />
![5Z3_dziala](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z3_dziala.png)<br />
- Komendą ```docker inspect <nazwa_kontenera> | jq '.[].NetworkSettings.Networks'``` można sprawdzić zadeklarowane aliasy dla kontenera(wraz z informacją, do której sieci są przyłączone). Np. kontener D2 ma zadeklarowane aliasy:
![5Z3_aliasy](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z3_aliasy.png)<br />

<b>Pytanie 1 z zadania 5Z3</b><br />
Nie można używać aliasów do komunikacji pomiędzy kontenerami przyłączonymi do dwóch różnych sieci ale pracujących w trybie mostu definiowanego przez użytkownika, ponieważ zasięg aliasu dotyczy tylko sieci, do której został przyłączony, zasięg nie wykracza po za tą sieć.
Aby to przestestować w praktyce, wchodzimy do kontenera S1 i instalujemy komende do pingowania:<br />
![5Z3_p1_przygotowanie](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z3_p1_przygotowanie.png)<br />
Następnie pingujemy kontener z aliasem host1(alias ten znajduje się w innej sieci niż S1):<br />
![5Z3_p1_ping_zly](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z3_p1_ping_zly.png)<br />
Pingowanie zakończyło sie niepowodzeniem.

Pingujemy kontener z aliasem apa2(alias ten znajduje się w tej samej sieci co S1):<br />
![5Z3_p1_ping_dobry](https://github.com/AdrianSzafranski/sprawozdanie3-docker/blob/main/screens/5Z3_p1_ping_dobry.png)<br />
Ping zakończył się powodzeniem.

Wykazaliśmy więc, że zasięg aliasu dotyczy tylko sieci, do której został przyłączony.
