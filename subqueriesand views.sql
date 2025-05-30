
-- subqueries
-- List the IDs of doctors who have handled more appointments than the average number of appointments handled by all doctors.
SELECT DOCTOR_ID,COUNT(APPOINTMENT_ID) FROM APPOINTMENTS 
GROUP BY DOCTOR_ID
HAVING COUNT(APPOINTMENT_ID) >
(SELECT AVG(APPOINTMENT_COUNT) FROM 
 (SELECT COUNT(*) AS APPOINTMENT_COUNT  FROM APPOINTMENTS GROUP BY DOCTOR_ID) 
 AS AVG_COUNTS);

 -- views
--  Create a view that shows each doctor's ID, their department name, and the total number of appointments they have handled.
CREATE VIEW DOCTOR_APPOINTMENT_SUMMARY AS
SELECT D.DOCTOR_ID,DE.DEPT_NAME,COUNT(APPOINTMENT_ID) AS TOTAL_APPOINTMENTS FROM APPOINTMENTS A
JOIN DOCTORS D ON A.DOCTOR_ID=D.DOCTOR_ID
JOIN DEPARTMENTS DE ON D.DOCTOR_ID=DE.DEPT_ID
GROUP BY D.DOCTOR_ID;

-- QUERING FROM VIEW
SELECT * FROM DOCTOR_APPOINTMENT_SUMMARY WHERE  TOTAL_APPOINTMENTS>5;

 
 