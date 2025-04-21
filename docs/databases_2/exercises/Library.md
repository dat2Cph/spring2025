---
title: Opgave i integrationstest (bibliotek)
description: Indledende opgave i integrationstest på localhost
layout: default
parent: Databaser II
permalink: /databases_2/exercises/Library/
nav_exclude: true
---

# Bibliotekssystem i Java og Postgres

Her er et ER-diagram, som cirka repræsenterer tabellerne på 3NF fra [normaliseringartiklen](../../databases_1/docs/Normalisering.pdf):

![ER-diagram](https://i.imgur.com/9vOkudp.png)

I sidste uge, oprettede vi en database for biblioteket i Postgres via pgAdmin.

Vi lavedede følgende SQL-forespørgsler:

   1. Find en låner ud fra et specifikt laaner_id.
   2. Find alle lånere, og vis deres data inklusive postnummer og by.
   3. Find alle bøger, og deres forfattere
   4. Find alle lånere og de bøger de har lånt. Medtag også bogtitler og evt. forfatter

Vi lavede også følgende DML sætninger:

   1. Indsæt en ny låner (insert)
   2. Opret et nyt udlån af en bog (insert)
   3. Fjern et udlån (delete)
   4. Rediger en bogtitel (update)

## Dagens opgave

I dag skal vi lave et Javaprojekt, som vha. JDBC kan lave de queries til databasen, som vi lavede vi pgAdmin.

1. Lav et nyt Maven Javaprojekt i IntelliJ
2. Find den XML-snippet i [Toolbox](../../toolbox/database/jdbc_templates.md#jdbc-driver-dependency) som definerer en dependency til postgres. Kopier denne og sæt den ind i din pom.xml. Opdater dine Maven dependencies for få hentet driveren.
3. Lav to packages i dit project og kald dem hhv. entities og persistence.
4. Så skal vi have lavet entityklasser. Lav klasser, der afspejler de entiteter, du har i din database (fx `Borrower`, `Book`, `Author`). Overvej om du behøver entities i Java til alle dine tabeller. Giv klasserne attributter, konstruktører og get/set-metoder.
5. Så skal vi lave klasser, der kan hente data fra databasen og lave dem til Javaobjekter. Vi bruger det design pattern, som hedder [Data Mapper](https://martinfowler.com/eaaCatalog/dataMapper.html), så vi laver en mapperklasse i vores persistencepakke. Start med en `BorrowerMapper`. Lav den uden at give den nogen metoder endnu.
6. Vi ønsker ikke, at vores mapper er hardcodet til at forbinde sig til en specifik database. Vi ønsker at bruge dependency injection. Derfor vil vi også gerne have en klasse DatabaseConnector, som tager sig af forbindelsen til den specifikke database. Find koden til at lave en `DatabaseConnector` i [Toolbox](../../toolbox/database/jdbc_templates.md#database-connector). Læg din `DatabaseConnector` i pakken persistence. Kig koden igennem og vær sikker på, at du forstår hvad der sker.

   Koden kompilerer ikke, for klassen gør brug af en hjemmelavet exception kaldet `DatabaseException`. Den skal vi også have lavet. Da vi gerne vil strukturere koden fornuftigt, skal du nu lave en pakke kaldet exceptions, hvor du kan lægge dine hjemmelavede exceptions. Du kan nu skrive din egen `DatabaseException` eller kopiere koden fra [Toolbox](../../toolbox/database/jdbc_templates.md#database-exception).

7. Nu har vi en klasse, der kan forbinde til en database. Den klasse vil vi gerne gøre brug af i vores mapper `BorrowMapper`. Så vi giver `BorrowMapper` en attribut `DatabaseConnector connector` og lader den tage en instans af `DatabaseConnector` som argument til sin konstruktør. Du kan finde inspiration til koden i [Toolbox](../../toolbox/database/jdbc_templates.md#usermapper-og-getuserbyid)

8. Vi har det nødvendige for at kunne begynde at hente data fra databasen. Vi starter med at lave en metode, som kan håndtere query 1. Find en låner ud fra et specifikt laaner_id.

   Lav metoden `public Borrower getBorrowerById(int id)` i din `BorrowerMapper`-klasse. Metoden skal tage et id som argument og returnere et `Borrower`-objekt med data fra databasen. Find inspiration til koden i [Toolbox](../../toolbox/database/jdbc_templates.md#usermapper-og-getuserbyid).

9. Det er tid til at teste vores kode. I main skal vi have oprettet et `DatabaseConnector`-objekt og et `BorrowerMapper`-objekt. `DatabaseConnector`-objektet skal oprettes med url, user, og password, der passer til den database vi vil bruge. Objektet skal gives til `BorrowerMapper` som argument til konstruktøren (dependency injection).

   Test i din main, at du kan kalde metoden `getBorrowerById(int id)` og få et objekt tilbage, som er populeret med data fra databasen. Du kan finde inspiration til koden i [Toolbox](../../toolbox/database/jdbc_templates.md#main-metode)

10. Lav nu mapper-metoder til de andre queries vi lavede i pgAdmin. Her skal du være opmærksom på at

- du har muligvis brug for flere mappere (fx `BookMapper` og `AuthorMapper`).
- du har brug for at lave joins, hvis du vil medtage både postnummer og by, når du opretter `Borrower`-objekter.
- du ikke skal sende fx et laaner_id med når du laver INSERT, da postgres selv generer nøglen. Hvis du gerne vil have id tilbage efter INSERT, skal du bruge
   `Statement.RETURN_GENERATED_KEYS`. Du kan finde inspiration til koden i [Toolbox](../../toolbox/database/jdbc_templates.md#createUser)

11. Prøv at lave mapper-metoder, som returnerer data, der ikke er entiteter. Fx kan du lave en metode, der returnerer en låner og en liste af de forfattere vedkommende har lånt bøger af. Lav en [Data Transfer Object](https://martinfowler.com/eaaCatalog/dataTransferObject.html) klasse, som kan bruges til de data. Læg klassen i en pakke kaldet dto.

Her kan du finde [forslag til løsninger](https://github.com/KongCPH/Library.git).
