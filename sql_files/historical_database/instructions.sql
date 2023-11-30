/*First create the historical database and then run the following commands in it*/

--Install postgres_fdw
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

--Create the remote server mapping
CREATE SERVER historical_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (dbname 'soundgood_music_school', host 'localhost', port '5432');

--Create  a user for the remote server
CREATE USER MAPPING FOR current_user
SERVER historical_server
OPTIONS (user 'postgres', password 'xxxxxx');

--Create local schema that will be used for the remote mapping
CREATE SCHEMA hist_schema;

--Import the whole public schema from historical_db
IMPORT FOREIGN SCHEMA public FROM SERVER historical_server INTO hist_schema;

-- Or As we chose : Import only the tables we need for the data we are looking after
IMPORT FOREIGN SCHEMA public
LIMIT TO (email, student_lesson, lesson,person,pricing_scheme,instrument,lesson_type,ensemble_lesson,instrument_type,instrument_stock,student_lesson,student)
FROM SERVER historical_server INTO hist_schema;


/*CREATE THE DENORMALIZED LESSON TABLE WITH REQUIRED DATA AND FILL IT WITH INSERTED DATA*/

--Denormalized lesson table
CREATE TABLE hist_schema.historical_lessons (
    "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    lesson_id int,
    lesson_type varchar(20),
    genre varchar(20),
    instrument varchar(50),
    lesson_price int,
    student_name varchar(100),
    student_email varchar(265)
);



INSERT INTO hist_schema.historical_lessons (
    lesson_id,
    lesson_type,
    genre,
    instrument,
    lesson_price,
    student_name,
    student_email
)
SELECT
    hsl.lesson_id,
    lt.type AS lesson_type,
    hel.genre AS lesson_genre,
    CASE WHEN lt.type = 'Ensemble' THEN NULL ELSE MIN(his.instrument_name) END AS instrument_name,
    hps.price AS lesson_price,
    CONCAT(hp.first_name, ' ', hp.last_name) AS student_name,
    e.email AS student_email
FROM
    hist_schema.student_lesson hsl
LEFT JOIN
    hist_schema.ensemble_lesson hel ON hsl.lesson_id = hel.lesson_id
LEFT JOIN
    hist_schema.person hp ON hsl.student_id = hp.person_id
LEFT JOIN
    hist_schema.lesson hl ON hsl.lesson_id = hl.lesson_id
LEFT JOIN
    hist_schema.pricing_scheme hps ON hl.price_id = hps.price_id
LEFT JOIN
    hist_schema.lesson_type lt ON hps.lessontype_id = lt.lessontype_id
LEFT JOIN
    hist_schema.email e ON hp.person_id = e.person_id
LEFT JOIN
    hist_schema.instrument_type it ON hsl.lesson_id = it.lesson_id
LEFT JOIN
    hist_schema.instrument ist ON it.instrument_id = ist.instrument_id
LEFT JOIN
    hist_schema.instrument_stock his ON ist.stock_id = his.stock_id
GROUP BY
    hsl.lesson_id, lt.type, hel.genre, hp.first_name, hp.last_name, e.email, hps.price
ORDER BY
    student_name;
