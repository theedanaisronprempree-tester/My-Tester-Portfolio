--4.1 ดึงข้อมูลทั้งหมด จาก employee
SELECT * FROM Employees

--4.2 เงินเดือน > 60,000
SELECT * FROM Employees WHERE salary > 60000

--4.3 ชื่อ  นามสกุล ของแผนก ไอที
SELECT  first_name,last_name FROM Employees 
INNER JOIN Departments on Employees.department_id = Departments.department_id
WHERE department_name = 'ฝ่ายไอที'

--4.4 ค่าเฉลี่ยเงินเดือน ของ แผนก HR ฝ่ายทรัพยากรบุคคล
SELECT  AVG(salary) as AVG_Salary FROM Employees 
INNER JOIN Departments on Employees.department_id = Departments.department_id
WHERE department_name = 'ฝ่ายทรัพยากรบุคคล'

--4.5 หาเงินเดือน สูงที่สุด max
SELECT MAX(salary) FROM Employees

--4.6 เงินเดือน < 40,000
SELECT * FROM Employees WHERE salary < 40000

--4.7 จำนวนพนักงานในแต่ละแผนก Group By
SELECT COUNT(*) As Count_Emp,department_id  FROM Employees GROUP BY department_id

--4.8 ชื่อ นามสกุล ชื่อแผนก
SELECT first_name,last_name,d.department_name FROM Employees e
LEFT JOIN Departments d on e.department_id = d.department_id

--4.9 เพิ่มเงินเดือน แผนก it ขึ้น 10%(*1.1) 
UPDATE Employees SET salary = salary*1.10
WHERE department_id = (Select department_id FROM Departments where department_name = 'ฝ่ายไอที')

Select * FROM Employees where department_id = 3

--4.10 ลบ ข้อมูล พนักงาน id = 17
DELETE from Employees
WHERE employee_id = 17