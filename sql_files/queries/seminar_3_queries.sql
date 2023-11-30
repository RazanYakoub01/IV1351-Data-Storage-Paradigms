/*Query 1*/

SELECT
    EXTRACT(YEAR FROM l.date) AS year,
    EXTRACT(MONTH FROM l.date) AS month,
    COUNT(l.lesson_id) AS total_lessons,
    SUM(CASE WHEN ps.lessontype_id = 1 THEN 1 ELSE 0 END) AS individual_lessons,
    SUM(CASE WHEN ps.lessontype_id = 2 THEN 1 ELSE 0 END) AS group_lessons,
    SUM(CASE WHEN ps.lessontype_id = 3 THEN 1 ELSE 0 END) AS ensemble_lessons
FROM
    lesson l
LEFT JOIN
    pricing_scheme ps ON l.price_id = ps.price_id
WHERE
	EXTRACT(YEAR FROM l.date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY
    EXTRACT(YEAR FROM l.date), EXTRACT(MONTH FROM l.date)
ORDER BY
    year, month;

/*Version 2 of Query 1 - not depending on ids*/
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
WHERE
	EXTRACT(YEAR FROM l.date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY
    EXTRACT(YEAR FROM l.date), EXTRACT(MONTH FROM l.date)
ORDER BY
    year, month;


/*Query 2*/

SELECT
    CASE
        WHEN siblings.no_of_siblings IS NULL THEN 0
        ELSE siblings.no_of_siblings
    END AS "No of Siblings",
    COUNT(students.student_id) AS "No of Students"
FROM (
    SELECT
        student_id,
        COUNT(*) AS no_of_siblings
    FROM
        sibling_student
    GROUP BY
        student_id
) siblings
RIGHT JOIN (
    SELECT
        s.student_id
    FROM
        student s
    LEFT JOIN
        sibling_student ss ON s.student_id = ss.student_id
    GROUP BY
        s.student_id
) students ON siblings.student_id = students.student_id
WHERE
    (siblings.no_of_siblings IS NULL OR siblings.no_of_siblings <= 2)
GROUP BY
    CASE
        WHEN siblings.no_of_siblings IS NULL THEN 0
        ELSE siblings.no_of_siblings
    END
ORDER BY
    "No of Siblings";



/*Query 3*/

SELECT
    i.instructor_id,
    p.first_name,
    p.last_name,
    COUNT(*) AS number_of_lessons
FROM
    instructor i
JOIN
    lesson l ON i.instructor_id = l.instructor_id
JOIN
    person p ON i.person_id = p.person_id
WHERE
    EXTRACT(MONTH FROM l.date) = 12 /*EXTRACT(MONTH FROM CURRENT_DATE)*/
	AND EXTRACT(YEAR FROM l.date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY
    i.instructor_id, p.first_name, p.last_name
HAVING
    COUNT(l.lesson_id) > 3
ORDER BY
    number_of_lessons DESC;



/*Query 4*/

SELECT 
    TO_CHAR(l.date, 'Day') AS day_of_week, 
    el.genre, 
    l.date, 
    CASE 
        WHEN COUNT(sl.student_id) = l.max_places THEN 'Full Booked' 
        WHEN COUNT(sl.student_id) >= l.max_places - 2 THEN '1-2 Seats Left' 
        ELSE 'More Seats Left' 
    END AS seats_status 
FROM 
    ensemble_lesson el 
JOIN 
    lesson l ON el.lesson_id = l.lesson_id 
LEFT JOIN 
    student_lesson sl ON l.lesson_id = sl.lesson_id 
WHERE 
    l.date BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '1 week' 
GROUP BY 
    TO_CHAR(l.date, 'Day'), el.genre, l.max_places, l.date
ORDER BY 
    TO_CHAR(l.date, 'Day'), el.genre, l.max_places, l.date;
