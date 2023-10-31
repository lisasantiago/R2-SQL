--count
SELECT count(*) FROM students
WHERE enroll_status = -1;

--list
SELECT lastfirst FROM students
WHERE enroll_status = -1;

-- Update pre-registered students
UPDATE students
SET enroll_status = 0
WHERE enroll_status = -1;