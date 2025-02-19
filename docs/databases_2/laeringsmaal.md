---
title: Læringsmål
description: Læringsmål for databaser
layout: default
parent: Databaser II
nav_order: 1
permalink: /databases-2/learningobjectives/
---

# Læringsmål for databaser

## DB uge 2: JDBC, mapper og integrationstest

Efter den anden uge vil du kunne

1. oprette og benytte en Connection / forbindelse til Postgres vha JDBC.

2. anvende CRUD operationer på en database vha JDBC.
   - "C" = "Create" = insert statementments i SQL
   - "R" = "Read" = select statements i SQL
   - "U" = "Update" = update statements i SQL
   - "D" = "Delete" = delte statements i SQL

3. bruge de to design patterns Mapper og DTO og forklare deres rolle i et design.

4. håndtere autogenerede nøgler ved inserts, herunder
   - forklare hvorfor vi nogle gange kan have behov for at få et `id` tilbage fra en netop oprettet række i Postgres. 
   - vise hvordan man gør det i Java. Hint: brug af Statement.RETURN_GENERATED_KEYS og getGeneratedKeys().

5. opretholde relationer fra Javaprogrammet i din database ved brug af fremmednøgler ved fx
   - at du i `sportsclub` databasen opretter et nyt medlem, og i samme ombæring tilmelder medlemmet nogle hold ved at indsætte nogle rækker i `registration` tabellen.

6. forklare hvorfor og hvornår vi skal bruge integrationstests.

7. opsætte og gennemføre integrationstest af databaseapplikationer.


