![olskers_cupcake](https://raw.githubusercontent.com/OwaisAD/olskers_cupcake/main/src/main/webapp/images/headercupcakeimage.png)

## Om projektet
Lidt information omkring projektet.
Tjek evt. rapporten ud under rapport mappen, for at dykke længere ned bag om projektet.
Projektet er udført af:
- @OwaisAD
- @Wolfgang1235
- @thomasfritzgboger

## Teknologier
##### Programmering:
* Java (V. …)
* MySQL (V….)
* HTML5 og CSS3
* JSP

##### Brugte software:
* IntelliJ IDEA (V. …)
* MySQL Workbench(V…)
* Safari, Google Chrome, Edge

##### Frameworks:
* MySQL connector (V. …)
* JSTL (V….)
* Bootstrap (V…)

#Logbog
Her er et link til vores logbog gennem projektet
https://docs.google.com/document/d/1u9PVX1bcuwbz_frAPK2hl1X3iWgCtnZhplq3GeTw7UY/edit?usp=sharing


## Hvordan køres projektet?
1. Først skal du clone projektet eller downloade en zip-fil med projektet til din arbejdsstation.
2. Åbn Workbench og kør sql-filen `cupcake3.sql`, som ligger i mappen `resources`. Den opretter de nødvendige databaser.
3. Du skal nok ændre kodeord til databasen i projektet. Det gøres under model-delen i filerne: `/persistence/ConnectionPool` i linie 13 og 14.
5. Til sidst skal du lave en Tomcat konfiguration. Dvs, 
   1. klik på "Add Configuration ..."
   2. Klik på "+" og vælg "Tomcat Server Local".
   3. Klik på "Fix knappen"
   4. Vælg war-exploded som deployment type
   5. Nu kan du klikke på den grønne play-knap for at bygge og køre projektet.

## Bemærkninger

Startkoden indeholder følgende:

- Strukturering i passende packages for overblik (MVC). Noget af strukturen er også givet af Maven, og kan ikke laves om. F.eks. opdelingen i `/java` og `/webapp`.
- Javaservlets
- JSP sider. Læg dem i WEB-INF som kun skal tilgås via en servlet.
- En super skrabet css-fil til styling
- Datamapper for user-tabellen, som anvender en connection pool.
- Fejlhåndtering med exceptions for databaseoperationer.
- Integrationstest af datamapperen for User.

Funktionelt kan applikationen:

- Vise en forside med links til undersider, som endnu ikke er lavet
- Logge en user på. Der findes to brugere i databasen.
    1. `user` med password: `1234` (rolle: `user`)
    2. `admin` med password: `1234` (rolle: `admin`)
- Man kan se på index.jsp hvordan man kan udnytte om en user er logget på eller ej.
- Hvis man indtaster ugyldige data under indlogning, bliver man sendt til en en fejlside.
- Logge en bruger af
- Begyndelsen på en metode til at tjekke om en given bruger har adgang ligger i `services`

## MVC arkitektur

![](documentation/mvc.jpg)
