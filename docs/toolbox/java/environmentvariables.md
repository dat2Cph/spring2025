---
title: Miljøvariabler i Java
description: Sådan sætter du miljøvariabler i Java
layout: default
nav_order: 10
parent: Java
grand_parent: Toolbox
permalink: /toolbox/java/environment-variables/
---

# Miljøvariabler i Java

Det kan være nødvendigt at sætte miljøvariabler i Java, når du arbejder med forskellige systemer eller konfigurationer. På 2. og 3. semester i Carport-projektet, skal du bruge miljøvariabler til at gemme dine Gmail credentials, når du sender e-mails. Det er også en god idé at gemme sine Postgres credentials i miljøvariabler, når du arbejder med databaser.

Udfordringen er at vi både arbejder på localhost (Mac og Windows) og på virtuelle Linux servere i skyen. Det er lidt forskelligt hvordan man sætter miljøvariabler i de forskellige systemer og det kan være lidt tricky at finde ud af.

## 1. Hvad er miljøvariabler?

Miljøvariabler er systemvariabler, der kan bruges til at gemme konfigurationer og indstillinger for dit program. De kan bruges til at gemme følsomme oplysninger som adgangskoder, API-nøgler og databaseforbindelser uden at inkludere dem direkte i din kode.
De kan også bruges til at ændre adfærden af dit program afhængigt af det miljø, det kører i (f.eks. udvikling, test eller produktion).

## 2. Hvordan

Herunder er en vejledning til at sætte miljøvariabler på din egen localhost maskine (Mac og Windows). Når det er gjort det enkelt at bruge dem i din Java-kode.

I det følgende bruger vi et eksempel med Gmail credentials. Det hænger sammen med en tutorial til at [sende emails med Gmail i Java](../../projects/carport/jakartamail/README.md).

Selvfølgelig! Her er en guide til, hvordan du **sætter miljøvariabler permanent**, så de er tilgængelige hver gang du åbner terminalen – både på **Mac/Linux** og **Windows**.

---

## 3. På **Mac/Linux**

Miljøvariabler sættes typisk i en af følgende filer i din hjemmemappe (`~`):

| Shell                        | Konfigurationsfil                   |
| ---------------------------- | ----------------------------------- |
| Bash                         | `~/.bash_profile` eller `~/.bashrc` |
| Zsh (standard i nyere macOS) | `~/.zshrc`                          |

### ✅ Trin-for-trin (Zsh og Bash)

1. **Åbn din terminal**
2. **Redigér `.zshrc` eller `.bashrc`** (afhængigt af din shell):

    ```bash
    nano ~/.zshrc       # hvis du bruger Zsh
    # eller
    nano ~/.bashrc      # hvis du bruger Bash
    ```

3. **Tilføj disse linjer i bunden af filen:**

    ```bash
    export MAIL_USERNAME="your.email@gmail.com"  (tast din gmail)
    export MAIL_PASSWORD="your-app-password"  (App Password, du har lavet på Gmail)
    ```

    Husk gåseøjnene når der er mellemrum i værdien. Som f.eks. i MAIL_PASSWORD.

4. **Gem og luk filen**

    * Tryk `CTRL + O`, `Enter` og derefter `CTRL + X` for at gemme i `nano`.

5. **Indlæs ændringerne med:**

    ```bash
    source ~/.zshrc     # eller source ~/.bashrc
    ```

6. **Test:**

    ```bash
    echo $MAIL_USERNAME
    ```

## 4. På **Windows**

Der er to måder: via GUI (nemmest) eller via PowerShell.

### ✅ 1. **Via GUI (Miljøvariabler i systemindstillinger)**

1. Søg på **"Environment Variables"** i startmenuen eller:

   * Højreklik på **Denne computer** / **This PC** → Egenskaber
   * Klik på **Avancerede systemindstillinger**
   * Klik på **Miljøvariabler** (nederst)

2. Under **"Brugervariabler"**, klik **Ny…**

   * Navn: `MAIL_USERNAME`
   * Værdi: `your.email@gmail.com`
   * Gentag for `MAIL_PASSWORD`

3. Genstart evt. din terminal eller IDE.

---

### ✅ 2. **Via PowerShell (permanent for bruger)**

```powershell
[System.Environment]::SetEnvironmentVariable("MAIL_USERNAME", "your.email@gmail.com", "User")
[System.Environment]::SetEnvironmentVariable("MAIL_PASSWORD", "your-app-password", "User")
```

> `"User"` gemmer dem i brugerens miljø. Brug `"Machine"` for system-wide (kræver admin).

### 🔁 Genstart terminal/IDE for at se ændringerne

---

## 🧪 Tjek værdierne bagefter

```powershell
$env:MAIL_USERNAME
```

## 5. I Java-koden

Når du har sat miljøvariablerne, kan du tilgå dem i din Java-kode ved hjælp af `System.getenv()`:

```java
String username = System.getenv("MAIL_USERNAME");
String password = System.getenv("MAIL_PASSWORD");
```
