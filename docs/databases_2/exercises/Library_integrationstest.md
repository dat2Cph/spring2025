---
title: Opgave i integrationstest (bibliotek)
description: Indledende opgave i integrationstest på localhost
layout: default
parent: Databaser
permalink: /databases_2/exercises/Library_integrationtest/
nav_exclude: true
---

# Test af bibliotekssystem

I dag skal vi lave integrationstest af vores bibliotekssystem. Det betyder, at vi skal bruge en testdatabase, som ligner vores produktionsdatabase (samme tabeller, datatyper, relationer mv.) men som indeholder testdata. 

Hvis du ikke har en biblioteksdatabase kørende i postgres, skal du lave en nu. Den kan fx se sådan ud:

![ER-diagram](https://i.imgur.com/9vOkudp.png)

Du finder scriptet til [ovenstående tabeller her](../databases_1/exercises/bibliotek_sql_queries.sql). 


## Dagens opgave. 
1. Åbn dit biblioteksprojekt i IntelliJ. Hvis du ikke har et projekt, der fungerer, kand du [clone et herfra](https://github.com/KongCPH/Library.git).
2. Under scr har du nok en mappe, der hedder test, med en undermappe java. Hvis ikke, så skal du lave dem nu. 
3. Lav en pakke i test.java som du kalder persistence. 
4. Hvis du ikke har en junit dependency i din pom.xml, skal du tilføje den nu og refreshe Maven:

```xml	
 <dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter-engine</artifactId>
    <version>5.8.2</version
    <scope>test</scope>
 </dependency>
```

5. Stil dig nu i klassen BorrowerMapper, højreklik og vælg Generate -> Test og sørg for at testen bliver placeret det korrekte sted (test -> java -> persistence).
6. Nu er vi klar til at lave test. Start med at lave nogle attributter:

```java
	private final static String USER = "postgres";
    private final static String PASSWORD = "postgres";
    private final static String URL = "jdbc:postgresql://localhost:5432/bibliotek?currentSchema=test";

    private static DatabaseConnector connector;
    private static BorrowerMapper borrowerMapper;
```

Måske skal du tilpasse URL'en. Det kommer an på hvad din database hedder. Du har også brug for et schema "test" i din database. Der er fordi vi skal bruge tabeller, der hedder det samme som dem, der ligger i public og man kan ikke have flere tabeller med samme navn indenfor et schema. Det er også meget rart at få test- og produktionstabeller adskilt. Lav det nye schema vha. pgAdmin. 

7. Nu skal vi lave en @BeforeEach-metode, som skal køres inden hver test. Metodens opgave er at slette eksisterende tabeller og indsætte nye med testdata. Du kan bruge nedenstående kode:

```java
 @BeforeAll
    public static void setUpClass() {
        try {
            connector = new DatabaseConnector(USER, PASSWORD, URL);
            // dependency injection
            borrowerMapper = new BorrowerMapper(connector);
            try (Connection testConnection = connector.getConnection())
            {
                try (Statement stmt = testConnection.createStatement())
                {
                    // The test schema is already created, so we only need to delete/create test tables
                    stmt.execute("DROP TABLE IF EXISTS test.bog CASCADE");
                    stmt.execute("DROP TABLE IF EXISTS test.forfatter CASCADE");
                    stmt.execute("DROP TABLE IF EXISTS test.laaner CASCADE");
                    stmt.execute("DROP TABLE IF EXISTS test.postnummer CASCADE");
                    stmt.execute("DROP TABLE IF EXISTS test.udlaan CASCADE");

                    // Removes sequenceobjects which controls autoincrement of keys
                    stmt.execute("DROP SEQUENCE IF EXISTS test.bog_bog_id_seq CASCADE;");
                    stmt.execute("DROP SEQUENCE IF EXISTS test.forfatter_forfatter_id_seq CASCADE;");
                    stmt.execute("DROP SEQUENCE IF EXISTS test.laaner_laaner_id_seq CASCADE;");

                    // Create tables as copy of original public schema structure
                    stmt.execute("CREATE TABLE test.bog AS (SELECT * from public.bog) WITH NO DATA");
                    stmt.execute("CREATE TABLE test.forfatter AS (SELECT * from public.forfatter) WITH NO DATA");
                    stmt.execute("CREATE TABLE test.laaner AS (SELECT * from public.laaner) WITH NO DATA");
                    stmt.execute("CREATE TABLE test.postnummer AS (SELECT * from public.postnummer) WITH NO DATA");
                    stmt.execute("CREATE TABLE test.udlaan AS (SELECT * from public.udlaan) WITH NO DATA");

                    // Create sequences for auto generating id's
                    stmt.execute("CREATE SEQUENCE test.bog_bog_id_seq");
                    stmt.execute("ALTER TABLE test.bog ALTER COLUMN bog_id SET DEFAULT nextval('test.bog_bog_id_seq')");
                    stmt.execute("CREATE SEQUENCE test.forfatter_forfatter_id_seq");
                    stmt.execute("ALTER TABLE test.forfatter ALTER COLUMN forfatter_id SET DEFAULT nextval('test.forfatter_forfatter_id_seq')");
                    stmt.execute("CREATE SEQUENCE test.laaner_laaner_id_seq");
                    stmt.execute("ALTER TABLE test.laaner ALTER COLUMN laaner_id SET DEFAULT nextval('test.laaner_laaner_id_seq')");

                    stmt.execute("INSERT INTO test.postnummer (postnr, by) VALUES " +
                        "(8000, 'Århus'), " +
                        "(9000, 'Aalborg'), " +
                        "(5000, 'Odense'), " +
                        "(4000, 'Roskilde'), " +
                        "(6000, 'Kolding') ");
                }
            }

            catch (SQLException e)
            {
                System.out.println(e.getMessage());
                fail("Database connection failed");
            }

        }
        catch (DatabaseException e){
            System.out.println(e.getMessage());
            fail("Database connection failed");
        }
    }

```

Der kan være noget af kode, du skal tilpasse alt efter hvad dine tabeller hedder og hvilke autogenererede nøgler, du har. 

8. Vi skal også have lagt testdata i tabellerne. Før hver test fjerner vi al data fra tabellerne og indsætter frisk data, så vi ved hvad der ligger i hver tabel, når vi tester. 

```java
@BeforeEach
    void setUp() {
        try (Connection testConnection = connector.getConnection()) {
            try (Statement stmt = testConnection.createStatement()) {
                // Delete all rows to start from scratch
                stmt.execute("DELETE FROM test.udlaan CASCADE");
                stmt.execute("DELETE FROM test.laaner CASCADE");
                stmt.execute("DELETE FROM test.bog CASCADE");
                stmt.execute("DELETE FROM test.forfatter CASCADE");

                // Set all sequence objects to start autoincrementing from 1
                stmt.execute("SELECT setval('test.forfatter_forfatter_id_seq', 1, false)");
                stmt.execute("SELECT setval('test.bog_bog_id_seq', 1, false)");
                stmt.execute("SELECT setval('test.laaner_laaner_id_seq', 1, false)");

                // Insert test data into forfatter-tabel
                stmt.execute("INSERT INTO test.forfatter (forfatter_id, navn) VALUES " +
                        "(DEFAULT, 'Karen Blixen'), " +
                        "(DEFAULT, 'Jussi Adler-Olsen'), " +
                        "(DEFAULT, 'H.C. Andersen')");

                // Insert test data into bog-tabel
                stmt.execute("INSERT INTO test.bog (bog_id, titel, udgivelsesaar, forfatter_id) VALUES " +
                        "(DEFAULT, 'Babettes Gæstebud', 1950, 1), " +
                        "(DEFAULT, 'Kvinden i buret', 2007, 2), " +
                        "(DEFAULT, 'Den lille Havfrue', 1837, 3)");

                // Insert test data into laaner-tabel
                stmt.execute("INSERT INTO test.laaner (laaner_id, navn, adresse, postnr) VALUES " +
                        "(DEFAULT, 'Anders Sørensen', 'Nørregade 10', 8000), " +
                        "(DEFAULT, 'Sofie Hansen', 'Vestergade 23', 9000), " +
                        "(DEFAULT, 'Emil Rasmussen', 'Østergade 5', 5000), " +
                        "(DEFAULT, 'Laura Mikkelsen', 'Søndergade 7', 4000), " +
                        "(DEFAULT, 'Mads Pedersen', 'Kirkestræde 14', 6000)");

                // Insert test data into udlaan-tabel
                stmt.execute("INSERT INTO test.udlaan (bog_id, laaner_id, dato) VALUES " +
                        "(1, 1, '2025-02-10'), " +
                        "(2, 1, '2025-02-15'), " +
                        "(3, 2, '2025-02-12'), " +
                        "(1, 3, '2025-02-18'), " +
                        "(2, 4, '2025-02-14'), " +
                        "(3, 5, '2025-02-20')");

                // More sequence object stuff
                stmt.execute("SELECT setval('test.forfatter_forfatter_id_seq', COALESCE((SELECT MAX(forfatter_id) FROM test.forfatter)+1, 1), false)");
                stmt.execute("SELECT setval('test.bog_bog_id_seq', COALESCE((SELECT MAX(bog_id) FROM test.bog)+1, 1), false)");
                stmt.execute("SELECT setval('test.laaner_laaner_id_seq', COALESCE((SELECT MAX(laaner_id) FROM test.laaner)+1, 1), false)");
            }
        } catch (SQLException throwables) {
            fail("Database connection failed");
        }
    }

```

9. Vi laver også lige en test på om der er hul igennem til databasen:

```java
 @Test
    void testConnection() throws SQLException {
        assertNotNull(connector.getConnection());
    }
```

10. Så er vi klar til at teste vores metoder. Her er et eksempel på en simpel test:

```java
@Test
    void testGetBorrowerById() throws DatabaseException{
        assertEquals(new Borrower("Anders Sørensen", "Nørregade 10" + " " + 8000, 1), borrowerMapper.getBorrowerById(1));

    }
```

Fortsæt med at teste andre mappermetoder. 
