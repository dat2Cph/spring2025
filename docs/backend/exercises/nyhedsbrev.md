---
title: Nyhedsbrev
description: Small backend project for class
layout: default
nav_order: 1
permalink: /backend/exercises/newsletter/
grand_parent: Backend
parent: Øvelser
---


# Justinas nyhedsbrev - Fullstack

Nu skal vi i gang med at kode frontend og backend til Justinas nyhedsbrev. Vi skal bruge Javalin, Thymeleaf og en database.

## Plan

1. Først udarbejder vi et use-case diagram
2. Dernæst beskrives hver use-case som en user story
3. På baggrund af det laver vi en simpel domænemodel og på baggrund af den et ER-diagram (ERD) over databasen.
4. Så går vi i gang med at kode. Først oprettes et Java / Maven projekt i IntelliJ ([instruktioner](../../toolbox/javalin/setup.md)
5. Dernæst oprettes en database i Postgres og der lægges lidt fake data ind i tabellerne.
6. Når alt dette er på plads begynder vi at implementere de enkelte user stories en ad gangen.

Det bruger vi så resten af ugen på. Her er en cirka plan over hvad vi skal nå at gennemgå:

### Tirsdag

- [ ] Use-case diagram
- [ ] User stories
- [ ] Domænemodel
- [ ] ER-diagram
- [ ] Projekt setup
- [ ] Database setup
- [ ] Indsæt fake data i databasen
- [ ] Implementer user story 1 osv

Der hører en del teknikker til at udvikle Javalin webapplikationer. Vi skal blandt andet gennem følgende:

- [ ] Opsætning af Javalin projekt
- [ ] Opsætning af Thymeleaf
- [ ] Opsætning af Postgres database og ConnectionPool
- [ ] Opsætning af datamappere
- [ ] Opsætning af routes
- [ ] Opsætning af controllers
- [ ] Opsætning af thymeleaf templates. Herunder layout, fragments, billeder, links, forms, knapper og diverse udtryk.
  - [ ] Variable Expressions: `${}`
  - [ ] Link (URL) Expressions: `@{}`
  - [ ] For-each loop: `th:each`
  - [ ] Conditional statements: `th:if`, `th:unless`, `th:switch`, `th:case`
- [ ] Behandling af http requests (GET, POST, PUT, DELETE)
- [ ] Behandling af form data
- [ ] Brug af sessions

### Onsdag - codelab

TBD -  det kommer an på hvor langt vi kommer tirsdag

### Torsdag

TBD -  det kommer an på hvor langt vi kommer torsdag

## Indholdselementer (assets)

Her er nyhedsbrevene fra CPH Business. De er i PDF format og kan downloades:

1. [01 Sep Okt 2024](../../frontend/exercises/docs/01_Nyhedsbrev_SepOkt_2024.pdf)
2. [02 Okt Nov 2024](../../frontend/exercises/docs/02_Nyhedsbrev_OktNov_2024.pdf)
3. [03 Nov Dec 2024](../../frontend/exercises/docs/03_Nyhedsbrev_NovDec_2024.pdf)
4. [04 Dec Jan 2025](../../frontend/exercises/docs/04_Nyhedsbrev_DecJan_2025.pdf)
5. [05 Jan Feb 2025](../../frontend/exercises/docs/05_Nyhedsbrev_JanFeb_2025.pdf)
6. [06 Feb Mar 2025](../../frontend/exercises/docs/06_Nyhedsbrev_FebMar_2025.pdf)

## Logopakke og Designguide

- [Download logoer](https://www.cphbusiness.dk/kontakt/pressekontakt#-download-logo-item)
- [Design guide](../../frontend/exercises/docs/cphbusiness-designguide_final.pdf)
