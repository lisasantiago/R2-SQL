SELECT DISTINCT entrydate, COUNT(entrydate) -- DISTINCT pulls unique entries only
FROM students
WHERE exitcode = 'NS'
GROUP BY entrydate -- GROUP BY will allow a total for each date. If you add other fields to the SELECT statement, you need to also add them to the GROUP BY clause
HAVING COUNT(entrydate) > 20
order by 1 desc