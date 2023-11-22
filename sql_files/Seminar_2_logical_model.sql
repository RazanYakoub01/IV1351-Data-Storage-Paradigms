CREATE TABLE adminstrative_staff (
 "staff_id"  int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY
);

CREATE TABLE adress (
 "adress_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "street" varchar(100),
 "zip_code" varchar(5),
 "city" varchar(50)
);

CREATE TABLE instrument_stock (
 "stock_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "instrument_name" varchar(50) NOT NULL,
 "brand" varchar(50),
 "maximum_stock" varchar(500) NOT NULL,
 "availability_stock" varchar(500) NOT NULL,
 "renting_price" int NOT NULL
);

CREATE TABLE lesson_type (
 "lessontype_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "type" varchar(10)
);

CREATE TABLE person  (
 "person_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "first_name" varchar(50),
 "last_name" varchar(50),
 "personal_number" varchar(12) NOT NULL UNIQUE,
 "birthdate" DATE
);

CREATE TABLE person_adress (
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 "adress_id" int NOT NULL REFERENCES "adress" ON DELETE CASCADE,
 PRIMARY KEY ("person_id", "adress_id")

);

CREATE TABLE phone (
 "phone_number"  varchar(20) NOT NULL,
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 PRIMARY KEY("phone_number", "person_id")
);

CREATE TABLE school_rules (
 "id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY ,
 "rule_id" int NOT NULL UNIQUE,
 "rule_description" varchar(500) NOT NULL,
 "rule_value" int NOT NULL,
 "valid_start" TIMESTAMP(6),
 "valid_end" TIMESTAMP(6)
);

CREATE TABLE skill_level (
 "skill_level_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "level" varchar(12)
);

CREATE TABLE soundgood_music_school (
 "campus_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY
);

CREATE TABLE student (
 "student_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "person_id" int NOT NULL REFERENCES "person"
);

CREATE TABLE contact_person (
 "person_id" int NOT NULL REFERENCES "person",
 "relation"  varchar(12),
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 PRIMARY KEY("person_id")
);

CREATE TABLE email (
 "email" varchar(265) UNIQUE NOT NULL,
 "person_id" int NOT NULL REFERENCES "person" ON DELETE CASCADE,
 PRIMARY KEY("email", "person_id")

);

CREATE TABLE instructor (
 "instructor_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "can_teach_ensemble" BOOLEAN,
 "person_id" int NOT NULL REFERENCES "person"
);

CREATE TABLE instrument (
 "instrument_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "stock_id" int NOT NULL REFERENCES "instrument_stock"
);

CREATE TABLE pricing_scheme (
 "price_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "price" int NOT NULL,
 "lessontype_id" int NOT NULL REFERENCES "lesson_type",
 "skill_level_id" int NOT NULL REFERENCES "skill_level", 
 "sibling_discount" numeric(20),
 "price_date" DATE
);

CREATE TABLE renting_period (
 "student_id" int NOT NULL REFERENCES "student",
 "date_from" DATE NOT NULL,
 "date_to" DATE NOT NULL,
 "instrument_id" int NOT NULL REFERENCES "instrument",
 PRIMARY KEY("student_id")

);

CREATE TABLE sibling_student (
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 "sibling_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 PRIMARY KEY ("student_id","sibling_id")
);

CREATE TABLE available_schedule (
 "instructor_id" int NOT NULL REFERENCES "instructor",
 "instrument_id" int NOT NULL REFERENCES "instrument",
 "date" DATE NOT NULL,
 "time" TIME(6) NOT NULL,
 "skill_level_id" int NOT NULL REFERENCES "skill_level" ON DELETE CASCADE,
 "lessontype_id" int NOT NULL REFERENCES "lesson_type" ON DELETE CASCADE,
 "staff_id"  int REFERENCES "adminstrative_staff" ON DELETE SET NULL,
 PRIMARY KEY ("instructor_id")
);

CREATE TABLE lesson (
 "lesson_id" int GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
 "classroom_number" varchar(50),
 "date" DATE NOT NULL,
 "time" TIME(6) NOT NULL,
 "campus_id" int NOT NULL REFERENCES "soundgood_music_school",
 "staff_id"  int REFERENCES "adminstrative_staff" ON DELETE SET NULL,
 "price_id" int NOT NULL REFERENCES "pricing_scheme",
 "instructor_id" int NOT NULL REFERENCES "instructor"
);

CREATE TABLE maximim_lesson_places (
 "max_number" int NOT NULL,
 "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 PRIMARY KEY ("max_number","lesson_id")
);

CREATE TABLE minimum_lesson_places (
 "min_number" int NOT NULL,
 "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 PRIMARY KEY ("min_number", "lesson_id")
);

CREATE TABLE student_lesson (
 "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
 "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 PRIMARY KEY ("student_id","lesson_id")
);

CREATE TABLE ensemble_lesson (
 "lesson_id" int NOT NULL REFERENCES "lesson",
 "genre" varchar(10),
 PRIMARY KEY ("lesson_id")
);

CREATE TABLE instrument_type (
 "instrument_id" int NOT NULL REFERENCES "instrument" ON DELETE CASCADE,
 "lesson_id" int NOT NULL REFERENCES "lesson" ON DELETE CASCADE,
 PRIMARY KEY ("instrument_id","lesson_id")
);