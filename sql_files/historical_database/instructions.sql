/*First create the historical database and then run the following commands in it*/

--Create the database
CREATE DATABASE historical_db;

--Move to the database 
\c historical_db;

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

--Import the whole public schema with all tables from historical_db
--IMPORT FOREIGN SCHEMA public FROM SERVER historical_server INTO hist_schema;

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
    student_lesson.lesson_id,
    lesson_type.type AS lesson_type,
    ensemble_lesson.genre AS lesson_genre,
    CASE WHEN lesson_type.type = 'Ensemble' THEN NULL ELSE MIN(instrument_stock.instrument_name) END AS instrument_name,
    price.price AS lesson_price,
    CONCAT(person.first_name, ' ', person.last_name) AS student_name,
    e.email AS student_email
FROM
    hist_schema.student_lesson student_lesson
LEFT JOIN
    hist_schema.ensemble_lesson ensemble_lesson ON student_lesson.lesson_id = ensemble_lesson.lesson_id
LEFT JOIN
    hist_schema.person person ON student_lesson.student_id = person.person_id
LEFT JOIN
    hist_schema.lesson lesson ON student_lesson.lesson_id = lesson.lesson_id
LEFT JOIN
    hist_schema.pricing_scheme price ON lesson.price_id = price.price_id
LEFT JOIN
    hist_schema.lesson_type lesson_type ON price.lessontype_id = lesson_type.lessontype_id
LEFT JOIN
    hist_schema.email e ON person.person_id = e.person_id
LEFT JOIN
    hist_schema.instrument_type instrument_type ON student_lesson.lesson_id = instrument_type.lesson_id
LEFT JOIN
    hist_schema.instrument instrument ON instrument_type.instrument_id = instrument.instrument_id
LEFT JOIN
    hist_schema.instrument_stock instrument_stock ON instrument.stock_id = instrument_stock.stock_id
GROUP BY
    student_lesson.lesson_id, lesson_type.type, ensemble_lesson.genre, person.first_name, person.last_name, e.email, price.price
ORDER BY
    student_name;
