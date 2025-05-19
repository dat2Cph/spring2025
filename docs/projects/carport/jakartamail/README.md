---
title: 5.2 Jakarta Mail
description: Tutorial, hvor du lærer at sende mails fra Java via Jakarta mail
layout: default
parent: Carport projekt
grand_parent: Projekter
nav_order: 7
permalink: /projekter/carport/jakarta-mail/
---

# Afsendelse af emails via Jakarta Mail

## Introduktion

Hvis du vil sende emails fra din Java applikation på en simpel måde, kan du bruge Jakarta mail. I første omgang vil vi sende en simpel email. Hvis du senere har brug for at sende HTML emails, kan du bruge Thymeleaf til at generere HTML indholdet. Mere om det senere.

## Forudsætninger

- Du skal have en Gmail-konto, som du kan bruge til at sende emails.
- Du skal have et Java-projekt klart, som du kan bruge til at teste koden. Det skal køre Java 17.

## 1. 🔐 Opret Gmail App Password

I opsætning af din Gmail konto **skal du**:

- Aktivere **2-Step Verification**
- Generere et **App Password**
- Bruge dit nylavede App kodeord i din Javakode i stedet for dit rigtige Gmail kodeord

Hvis du ikke kan finde App Passwords, kan du finde det under **Manage your google account** og søg på **App Passwords**. Lav et App Password til din Java applikation, kopier det og gem det et sikkert sted.

## 2. 🗂️ Struktur

For at holde det enkelt, vil vi kun have én klasse til at sende emails. Du kan dog opdele det i flere klasser, hvis du ønsker det. Her er den foreslåede struktur:

```plaintext
src/
└── main/
    └── java/
        └── util/
            └── GmailEmailSender.java
```

## 3. 🧩 Maven `pom.xml` – nødvendige dependencies

```xml
<dependencies>
    <!-- Jakarta Mail API -->
    <dependency>
        <groupId>jakarta.mail</groupId>
        <artifactId>jakarta.mail-api</artifactId>
        <version>2.1.3</version>
    </dependency>
    <!-- Angus Mail (Jakarta Mail implementering) -->
    <dependency>
        <groupId>org.eclipse.angus</groupId>
        <artifactId>angus-mail</artifactId>
        <version>2.0.3</version>
    </dependency>
</dependencies>
```

## 4. 🧪 Miljøvariabler

Man kan sætte miljøvariabler i operativsystemet eller i sin IDE. Det er en god praksis at holde dine credentials uden for koden, så de ikke bliver delt utilsigtet via Git og GitHub. Her er en [tutorial, hvor du kan lære at sætte de to miljøvariabler](../../../toolbox/java/environmentvariables.md)  `MAIL_USERNAME` og `MAIL_PASSWORD` en gang for alle dine Java-projekter.

## 5. 📄 Tilføj klassen `util/GmailEmailSender.java`

Det er her selve afsendelse af emailen sker. Koden er baseret på [Jakarta Mail](https://eclipse-ee4j.github.io/jakartaee9-tutorial/jakarta-mail.html) og bruger SMTP til at sende emails via Gmail. Bemærk at Jakarta Mail er en specikation og ikke en implementering. Den faktiske implementering er `angus-mail`, som er en del af Jakarta Mail.

```java
package util;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class GmailEmailSender {

    private final String username;
    private final String password;

    public GmailEmailSender() {
        this.username = System.getenv("MAIL_USERNAME");
        this.password = System.getenv("MAIL_PASSWORD");

        if (username == null || password == null) {
            throw new IllegalStateException("MAIL_USERNAME and MAIL_PASSWORD environment variables must be set.");
        }
    }

    public void sendPlainTextEmail(String to, String subject, String body) throws MessagingException {
        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true"); // TLS
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setText(body); // Plain text only

        Transport.send(message);
        System.out.println("Email sent successfully to " + to);
    }

    // 🧪 Main-metode til test
    public static void main(String[] args) {
        GmailEmailSender sender = new GmailEmailSender();

        String to = "recipient@example.com";  // Erstat med din modtager
        String subject = "Testmail fra Java";
        String body = "Hej! Dette er en simpel testmail sendt med Java og Jakarta Mail.";

        try {
            sender.sendPlainTextEmail(to, subject, body);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
```

---

## 6. ✅ Kør det

1. Kør `main()`-metoden i `GmailEmailSender.java`
2. Tjek om du har modtaget emailen i din indbakke.
3. Hvis du ikke modtager emailen, skal du tjekke din spam-mappe.

## 7. 📧 HTML emails med Thymeleaf skabeloner

Hvis du vil sende HTML emails, kan du bruge Thymeleaf til at generere HTML indholdet. I stil med hvordan vi gør det i Javalin. Det kan være en lidt større udfordring at sende billeder afsted, da de enten skal ligge online eller være vedhæftet emailen. Det udelader vi i første omgang.

## 8. Ny klasse til HTML emails

For stadig at kunne sende simple mails laver vi en ny klasse `util/GmailEmailSenderHtml.java`:

```java
package app.util;

import app.config.ThymeleafConfig;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import java.util.Map;
import java.util.Properties;

public class GmailEmailSenderHTML {

    private final String username;
    private final String password;
    private final TemplateEngine templateEngine;

    public GmailEmailSenderHTML() {
        // Hent login fra miljøvariabler
        this.username = System.getenv("MAIL_USERNAME");
        this.password = System.getenv("MAIL_PASSWORD");

        if (username == null || password == null) {
            throw new IllegalStateException("MAIL_USERNAME og MAIL_PASSWORD miljøvariabler skal være sat.");
        }

        // Genbrug konfiguration fra ThymeleafConfig
        this.templateEngine = ThymeleafConfig.templateEngine();
    }

    public String renderTemplate(String templateName, Map<String, Object> variables) {
        Context context = new Context();
        context.setVariables(variables);
        return templateEngine.process(templateName, context);
    }

    public void sendHtmlEmail(String to, String subject, String htmlBody) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
        message.setSubject(subject);
        message.setContent(htmlBody, "text/html; charset=UTF-8");

        Transport.send(message);
        System.out.println("HTML-mail sendt til " + to);
    }

    // 🧪 Main-metode til test
    public static void main(String[] args) {
        GmailEmailSenderHTML sender = new GmailEmailSenderHTML();

        String to = "recipient@gmail.com";   // Erstat med din modtager
        String subject = "HTML test med Thymeleaf";

        // Opret en Thymeleaf kontekst med variabler. Tilføj dine egne værdier.
        Map<String, Object> variables = Map.of(
                "title", "Velkommen!",
                "name", "Jon",
                "message", "Dette er en HTML-mail genereret med Thymeleaf og sendt med Gmail SMTP."
        );

        String html = sender.renderTemplate("email.html", variables); // bruger templates/email.html

        try {
            sender.sendHtmlEmail(to, "HTML mail test", html);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
```

## 9. Lav en Thymeleaf skabelon

```html
<!-- src/main/resources/templates/email.html -->
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8" />
</head>
<body>
    <h1 th:text="${title}">Fallback titel</h1>
    <p>Hej <strong th:text="${name}">Bruger</strong>,</p>
    <p th:text="${message}">Dette er standardbeskeden.</p>
</body>
</html>
```

Her bliver `title`, `name` og `message` erstattet med værdierne fra Java koden via et hashmap. Det er en god idé at lave en fallback værdi, så du kan se om Thymeleaf skabelonen virker.
