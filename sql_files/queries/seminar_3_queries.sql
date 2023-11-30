/*Query 1*/

-- View To provide lesson statistics per month during a specifik year
CREATE VIEW LessonStatistics AS
SELECT
    EXTRACT(YEAR FROM l.date) AS year,
    EXTRACT(MONTH FROM l.date) AS month,
    COUNT(l.lesson_id) AS total_lessons,
    SUM(CASE WHEN lt.type = 'Individual' THEN 1 ELSE 0 END) AS individual_lessons,
    SUM(CASE WHEN lt.type = 'Group' THEN 1 ELSE 0 END) AS group_lessons,
    SUM(CASE WHEN lt.type = 'Ensemble' THEN 1 ELSE 0 END) AS ensemble_lessons
FROM
    lesson l
LEFT JOIN
    pricing_scheme ps ON l.price_id = ps.price_id
LEFT JOIN
    lesson_type lt ON ps.lessontype_id = lt.lessontype_id
GROUP BY
    EXTRACT(YEAR FROM l.date), EXTRACT(MONTH FROM l.date);


-- The final query
SELECT * FROM LessonStatistics 
WHERE year = EXTRACT(YEAR FROM CURRENT_DATE) 
ORDER BY
    year, month;



/*Query 2*/

-- View for counting siblings
CREATE VIEW SiblingCounts AS
SELECT
    student_id,
    COUNT(*) AS no_of_siblings
FROM
    sibling_student
GROUP BY
    student_id;

-- View for getting distinct students
CREATE VIEW DistinctStudents AS
SELECT
    s.student_id
FROM
    student s
LEFT JOIN
    sibling_student ss ON s.student_id = ss.student_id
GROUP BY
    s.student_id;


--The final query
SELECT
    CASE
        WHEN siblings.no_of_siblings IS NULL THEN 0
        ELSE siblings.no_of_siblings
    END AS "No of Siblings",
    COUNT(students.student_id) AS "No of Students"
FROM
    SiblingCounts siblings
RIGHT JOIN
    DistinctStudents students ON siblings.student_id = students.student_id
WHERE
    (siblings.no_of_siblings IS NULL OR siblings.no_of_siblings <= 2)
GROUP BY
    siblings.no_of_siblings
ORDER BY
    "No of Siblings";


/*Query 3*/

-- View to track instructor's lessons per month
CREATE VIEW instructor_lessons_per_month AS 
SELECT
    i.instructor_id,
    p.first_name,
    p.last_name,
    EXTRACT(MONTH FROM l.date) AS lesson_month,
    EXTRACT(YEAR FROM l.date) AS lesson_year,
    COUNT(*) AS number_of_lessons
FROM
    instructor i
JOIN
    lesson l ON i.instructor_id = l.instructor_id
JOIN
    person p ON i.person_id = p.person_id
GROUP BY
    i.instructor_id, p.first_name, p.last_name, lesson_month, lesson_year;


--The final query
SELECT
    instructor_id,
    first_name,
    last_name,
    number_of_lessons
FROM
    instructor_lessons_per_month
WHERE 
    lesson_month = 12 --EXTRACT(MONTH FROM CURRENT_DATE)
    AND lesson_year = EXTRACT(YEAR FROM CURRENT_DATE)
    AND number_of_lessons > 3
ORDER BY
    number_of_lessons DESC;


/*Query 4*/

CREATE MATERIALIZED VIEW ensemble_lesson_status AS
SELECT 
    TO_CHAR(l.date, 'Day') AS day_of_week, 
    el.genre, 
    l.date, 
    CASE 
        WHEN COUNT(sl.student_id) >= l.max_places THEN 'Full Booked' 
        WHEN COUNT(sl.student_id) >= l.max_places - 2 THEN '1-2 Seats Left' 
        ELSE 'More Seats Left' 
    END AS seats_status 
FROM 
    ensemble_lesson el 
JOIN 
    lesson l ON el.lesson_id = l.lesson_id 
LEFT JOIN 
    student_lesson sl ON l.lesson_id = sl.lesson_id 
GROUP BY 
    TO_CHAR(l.date, 'Day'), el.genre, l.max_places, l.date;



-- An index on the materialized view for better performance
CREATE INDEX idx_lesson_status_date ON ensemble_lesson_status (date);

-- Refresh the materialized view
REFRESH MATERIALIZED VIEW ensemble_lesson_status;


-- The final query
SELECT
    day_of_week,
    genre,
    date,
    seats_status
FROM
    ensemble_lesson_status
WHERE 
    date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '1 week' 
ORDER BY
    date;


