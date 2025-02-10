---
title: Databaser I
description: Undervisningsmaterialer til SQL og datamodellering
layout: default
has_children: true
nav_order: 6
permalink: /databases-1/
---


# Databaser 

## Uge 1: PostgreSQL, SQL og datamodellering

## Læringsmål 

[Læringsmål for uge 1](./laeringsmaal.md#uge-1-normalisering-og-sql)

## Mandag: 
Review af sidste uge
Online hjælp til installation af Docker og Postgres kl. 13-14 

## Tirsdag: Postgres og SQL
### Forberedelse
Der er en del forberedelse til den første databaseuge. 

Du skal installere lidt software: Docker, Postgres og PgAdmin. Det er vigtigt, at du ikke blot installerer Postgres lokalt, men gør det via Docker. Hvis du ikke kan få det til at virke, så kom forbi online hjælp mandag eftermiddag.
- [Videotutorial til at installere Docker, Postgres og PgAdmin](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=b2d67d7f-1dfe-4fe5-894c-b1170155d75f)
- [Teksttutorial med filer og kommandoer](https://github.com/dat2Cph/2semDockerSetupLocal)

Du skal have set to videoer:
- [Database keys made easy](https://www.youtube.com/watch?v=8wUUMOKAK-c)
- [Learn SQL Joins](https://www.youtube.com/watch?v=nivyaiCeWjs). Du behøver kun se de første 9:10 minutter om innner join.

Du skal genopfriske SQL:
- [Strukturen i SQL queries][./exercises/docs/sqlintro.pfd]
- [SQL tutorial](https://www.w3schools.com/sql/default.asp). Du skal kigge på de første sider: SQL HOME, SQL Intro, SQL Syntax, SQL Select og SQL Where. Læs teksten og lav de små Try It Yourself øvelser. Du er velkommen til at gå videre med flere funktioner, men vi kommer også til at øve det i timen. 
- [DDL, DML og queries](./exercises/docs/ddl_dml_queries.md). Du behøver ikke læse alt på Postgres dokumentation, som der linkes til, men du skal have en forståelse for hvad DDL, DML og queries er. 

### Andre ressourcer (som er nyttige men ikke obligatoriske)
- [Postgres' dokumentation](https://www.postgresql.org/docs/16/index.html)
- [Slides]
- [Introduktion til databaser (Jon)](https://cphbusiness.cloud.panopto.eu/Panopto/Pages/Viewer.aspx?id=0f2388a3-48a8-4a27-9ff8-ae4d00d94ad5)

### Program
- Tjek ind. Har alle Docker, Postgres og PgAdmin oppe at køre?
- Guidet tour i PgAdmin
- DDL, DML, CRUD, nøgler og hvad det hedder alt sammen
- [Opgave: SQL basis][./exercises/classicmodelsbasis.md)]
- [Vejledende løsninger]
- Introduktion til joins
- [Opgave: Simple joins][]

## Onsdag
Codelab øvelser
- Joins på papir
- [Opgave: Classic Cars joins]

## Torsdag
### Forberedelse
Du skal have set de to videoer
- [Entity Relationship Diagrams](https://www.youtube.com/watch?v=LowjDtiNlk4)
- [Learn Database Normalization](https://www.youtube.com/watch?v=GFQaEYEc8_8). Du behøver ikke se delen om 4NF og 5NF.

Og læst følgende artikel
- [Normalisering](./exercises/doc/Normalisering.pdf)

### Program
- Hvorfor normalisering?
- [Opgave: ERD og normalisering]
- Diskussion af opgave
- [Opgave: implementer ERD i Postgres]

### Andre ressourcer
- [Video om normalisering]

## Fredag
- [Fredagsopgave](./exercises/exercise_bibliotek.md)

