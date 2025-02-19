---
title: Opgave i integrationstest (bibliotek)
description: Indledende opgave i integrationstest på localhost
layout: default
parent: Databaser
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

Her kan du finde [forslag til løsninger](../../databases_1/exercises/bibliotek_sql_queries.sql).

## Dagens opgave

Lav et nyt Maven Javaprojekt i IntelliJ

1. Lav en Connectionklasse, hvor du kan lave en DB connection til biblioteksdatabasen
2. Lav entities, der svarer til tabellerne i din database
2. Lav en DataMapper ("BibliotekMapper") og en række metoder, som svarer til 3.1, 3.2, 3.3, 3.4,  4.1, 4.2, 4.3 og 4.4.
