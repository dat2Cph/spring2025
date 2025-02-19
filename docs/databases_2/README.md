---
title: Databaser II
description: Undervisningsmaterialer til JDBC og integrationstest
layout: default
has_children: true
nav_order: 7
permalink: /databases-2/
---


# Databaser 

## Uge 2: JDBC og integrationstest

## Læringsmål
- [Læringsmål for uge 2](./laeringsmaal.md#uge-2-java-jdbc-og-integrationstest)

## Mandag
- Review af sidste uge. 

## Tirsdag: JDBC, Mapper og DTO

### Forberedelse
Du skal læse følgende
- [Introduktion til JDBC](https://www.geeksforgeeks.org/introduction-to-jdbc/)
- [Data Mapper](https://martinfowler.com/eaaCatalog/dataMapper.html)
- [Data Transfer Object](https://martinfowler.com/eaaCatalog/dataTransferObject.html)

Hvis du ikke er blevet færdig med [biblioteksopgaven](../../databases_1/exercises/exercise_bibliotek.md) fra i fredags, så lav den, da vi skal bruge den i undervisningen. Alternativt kan du hente et [script](../../databases_1/exercise/solutions_bibliotek_create_db.sql) som kan generere tabellerne for dig og fylde dem med data. 

### Program

Vi bygger et Javaprogram sammen, som kan tilgå biblioteksdatabasen. Vi gør brug af de to design patterns Mapper og Data Transfer Objects, samt Dependency Injection.

[Dagens opgave](./exercises/Library.md)

## Onsdag
Codelab øvelse:

[Sportsclub](https://github.com/dat2Cph/dat2-sportsclub)

Der er en gennemgang af hvordan opgaven kan løses i [denne video](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=1d2e2b6c-6a04-4be4-b645-ae54014e2f79) (og i starten vises også hvordan man cloner startkoden fra git). Bemærk, at der bruges MySQL i videoen.


## Torsdag
### Forberedelse

Vi laver integrationstests til det system, vi byggede i tirsdags. 

[Dagens opgave](./excercises/Library_integratonstest.md)


## Fredag

[Fredagsopgave](https://github.com/dat2Cph/dat2-sportsclub/tree/integrationtest)

- Der er en gennemgang af hvordan opgaven kan løses i [denne video](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=940330d7-5824-4a97-9ea8-ae550008a069) (og i starten vises også hvordan man cloner startkoden fra git). Bemærk igen, at der bruges MySQL i videoen.


- [Java og JDBC](./exercises/jdbc.md)
- [Integrationstest](./exercises/integrationstest.md)
- [SchoolHack opgave (bibliotek)](./integrationstest/exercise_bibliotek.md)
