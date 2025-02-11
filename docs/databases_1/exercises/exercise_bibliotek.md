---
title: Bibliotekssystem
description: Indledende opgave i SQL
layout: default
nav_order: 3
parent: Øvelser
grand_parent: Databaser I
permalink: /databases-1/exercises/bibliotek/
---

# Databaser og SQL: fredagsopgave

Denne fredag er sat af til følgende:

1. Færdiggør de af ugens opgaver, du ikke har nået.
2. Lav den nedenstående opgave, hvor du skal implementere et bibliotekssystem inspireret af datamodellen fra [normaliseringsartiklen](../docs/Normalisering.pdf).

## Bibliotekssystem i Postgres

Den overordnede opgavebeskrivelse lyder således:

> Vi skal have konstrueret en database til et simpelt bibliotek. Derfor begynder vi med at analysere os frem til en datamodel og fylde lidt data i. Datamodellen skal selvfølgelig være på 3. normalform.
>
> Vi har en række forespørgsler, som vi gerne vil kunne trække ud af databasen. F.eks.
>
> 1. Find en låner ud fra et specifikt laaner_id.
> 2. Find alle lånere, og vis deres data inklusive postnummer og by.
> 3. Find alle bøger, og deres forfattere. Vi vil gerne vise alle data på bøgerne og forfatterne i samme udtræk.
> 4. Find alle lånere og de bøger de har lånt. Medtag også bogtitler og evt. forfatter
> 5. Vis alle de udlån, som har at gøre med en bestemt bog. F.eks. "Den gamle mand og havet" af Ernest Hemmingway.

Her er nogle punkter, som kan hjælpe dig på vej:

1. Kig normaliseringsartiklen igennem og lav en skitse på papir over hvilke tabeller, du har brug for for at bygge bibliotekssystemet. Fordi artiklen gradvist normaliserer tabellerne, skal du holde tungen lige i munden. Hint: Det virker fornuftigt med 5 tabeller
2. Opret database i Postgres. Lav dernæst et ERD i Postgres' diagram-editor, som svarer til din skitse. Den skal naturligvis være på 3NF. 
3. "Forward engineer" diagrammet til databasen ved at bruge SQL-knappen i din ERD editor, som generer et script.
4. Fyld lidt data i tabellerne. Kig evt. i artiklen for at finde inspiration til bogtitler og lånere.
5. Lav følgende SQL-forespørgsler i Query Tool:
   1. Find en låner ud fra et specifikt laaner_id.
   2. Find alle lånere, og vis deres data inklusive postnummer og by.
   3. Find alle bøger, og deres forfattere
   4. Find alle lånere og de bøger de har lånt. Medtag også bogtitler og evt. forfatter
   5. Vis alle de udlån, som har at gøre med en bestemt bog. F.eks. "Den gamle mand og havet" af Ernest Hemmingway.
5. Lav følgende DML sætninger i Query Tool:
   1. Indsæt en ny låner (insert)
   2. Opret et nyt udlån af en bog (insert)
   3. Fjern et udlån (delete)
   4. Rediger en bogtitel (update)

### Eksempel SQL-kode til opgaverne

Her er vejledende løsninger:

- [Bibliotek (opret DB)](./solutions_bibliotek_create_db.sql)
- [Bibliotek (sql queries)](./solutions_bibliotek_queries.sql)
