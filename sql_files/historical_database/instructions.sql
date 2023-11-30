/*First create the historical database and then run the following commands in it*/

CREATE EXTENSION IF NOT EXISTS postgres_fdw;


CREATE SERVER historical_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (dbname 'soundgood_music_school', host 'localhost', port '5432');


CREATE USER MAPPING FOR current_user
SERVER historical_server
OPTIONS (user 'postgres', password 'xxxxxx');


/*TO COPY DATA FROM ANOTHER TABLE IN THE ORIGINAL DATABASE*/ 

CREATE FOREIGN TABLE historical_email (
    email VARCHAR(265) UNIQUE NOT NULL,
    person_id INT NOT NULL
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'email');


CREATE FOREIGN TABLE historical_student_lesson (
    student_id INT NOT NULL,
    lesson_id INT NOT NULL
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'student_lesson');

CREATE FOREIGN TABLE historical_lesson (
    lesson_id INT PRIMARY KEY,
    classroom_number VARCHAR(50),
    date DATE NOT NULL,
    time TIME(6) NOT NULL,
    campus_id INT NOT NULL,
    staff_id INT,
    price_id INT NOT NULL,
    instructor_id INT NOT NULL,
    min_places INT NOT NULL,
    max_places INT NOT NULL
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'lesson');


CREATE FOREIGN TABLE historical_person (
    person_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    personal_number VARCHAR(12) NOT NULL UNIQUE,
    birthdate DATE
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'person');


CREATE FOREIGN TABLE historical_pricing_scheme (
    price_id INT PRIMARY KEY,
    price INT NOT NULL,
    lessontype_id INT NOT NULL,
    skill_level_id INT NOT NULL,
    sibling_discount NUMERIC(20),
    price_date DATE
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'pricing_scheme');


CREATE FOREIGN TABLE historical_instrument (
    instrument_id INT PRIMARY KEY,
    stock_id INT NOT NULL
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'instrument');


CREATE FOREIGN TABLE historical_lesson_type (
    lessontype_id INT,
    type VARCHAR(10)
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'lesson_type');

CREATE FOREIGN TABLE historical_ensemble_lesson (
    lesson_id INT,
    genre VARCHAR(10)
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'ensemble_lesson');


CREATE FOREIGN TABLE historical_instrument_type (
    instrument_id INT,
    lesson_id INT
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'instrument_type');


CREATE FOREIGN TABLE historical_instrument_stock (
    stock_id INT,
    instrument_name VARCHAR(50),
    brand VARCHAR(50),
    maximum_stock VARCHAR(500),
    availability_stock VARCHAR(500),
    renting_price INT
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'instrument_stock');



CREATE FOREIGN TABLE historical_student_lesson (
    student_id INT,
    lesson_id INT
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'student_lesson');


CREATE FOREIGN TABLE historical_student (
    student_id INT,
    person_id INT
)
SERVER historical_server
OPTIONS (schema_name 'public', table_name 'student');


/*CREATE THE DENORMALIZED LESSON TABLE WITH REQUIRED DATA AND FILL IT WITH INSERTED DATA*/
CREATE TABLE historical_lessons (
    "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
    lesson_id int,
    lesson_type varchar(20),
    genre varchar(20),
    instrument varchar(50),
    lesson_price int,
    student_name varchar(100),
    student_email varchar(265)
);



INSERT INTO historical_lessons (
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
    historical_student_lesson hsl
LEFT JOIN
    historical_ensemble_lesson hel ON hsl.lesson_id = hel.lesson_id
LEFT JOIN
    historical_person hp ON hsl.student_id = hp.person_id
LEFT JOIN
    historical_lesson hl ON hsl.lesson_id = hl.lesson_id
LEFT JOIN
    historical_pricing_scheme hps ON hl.price_id = hps.price_id
LEFT JOIN
    historical_lesson_type lt ON hps.lessontype_id = lt.lessontype_id
LEFT JOIN
    historical_email e ON hp.person_id = e.person_id
LEFT JOIN
    historical_instrument_type it ON hsl.lesson_id = it.lesson_id
LEFT JOIN
    historical_instrument ist ON it.instrument_id = ist.instrument_id
LEFT JOIN
    historical_instrument_stock his ON ist.stock_id = his.stock_id
GROUP BY
    hsl.lesson_id, lt.type, hel.genre, hp.first_name, hp.last_name, e.email, hps.price;
