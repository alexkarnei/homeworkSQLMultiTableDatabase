1.
SELECT  t.name||' '||t.surname AS fullname, g.name
FROM public."Teachers" t,public."Groups" g,public."Lectures" l ,public."Groups_lectures" gl
WHERE t.id=l.teacher_id AND l.id=gl.lecture_id AND g.id = gl.group_id; 

2.
SELECT  f.name
FROM public."Faculties" f
WHERE f.financing < (SELECT SUM(financing) FROM public."Departments" d WHERE d.faculty_id = f.id); 

3.
SELECT c.surname, g."name"
FROM public."Curators" c, public."Groups" g, public."Groups_curators" gc
WHERE gc.group_id = g.id AND gc.curator_id = c.id;

4.
SELECT c.surname, g."name"
FROM public."Curators" c, public."Groups" g, public."Groups_curators" gc
WHERE gc.group_id = g.id AND gc.curator_id = c.id;

5.
SELECT t.surname AS teacher_on_faculty, f.name AS faculty_name
FROM public."Teachers" t,
	 public."Lectures" l,
	 public."Groups_lectures" gl, 
	 public."Groups" g,
	 public."Departments" d,
	 public."Faculties" f
WHERE t.id=l.teacher_id AND 
	  gl.lecture_id= l.id AND 
	  g.id = gl.group_id AND 
	  g.department_id=d.id AND
	  d.faculty_id = f.id;

6.
SELECT d."name" AS department, g."name" AS name_group
FROM public."Departments" d, public."Groups" g
WHERE g.department_id = d.id;

7.
SELECT d."name" AS department, g."name" AS name_group
FROM public."Departments" d, public."Groups" g
WHERE g.department_id = d.id;

8.
SELECT d."name"
FROM public."Subject" s,
	 public."Departments" d,
	 public."Lectures" l,
	 public."Groups_lectures" gl,
	 public."Groups" g
WHERE s."name" LIKE 'Database Theory' 
	 AND s.id = l.subject_id 
	 AND l.id = gl.lecture_id 
	 AND gl.group_id =g.id
	 AND g.department_id = d.id;

9.
SELECT g."name"
FROM public."Groups" g,
	 public."Departments" d,
	 public."Faculties" f
WHERE g.department_id = d.id
	  AND d.faculty_id = f.id
	  AND f."name" LIKE 'Computer Science';

10.
SELECT g."name", f."name"
FROM public."Groups" g,
	 public."Departments" d,
	 public."Faculties" f
WHERE g.department_id = d.id
	  AND d.faculty_id = f.id
	  AND g."year" = 5;

11.
SELECT DISTINCT t."name"||' '||t.surname AS fullname, s.name, g.name
FROM public."Groups" g,
	 public."Departments" d,
	 public."Lectures" l,
	 public."Teachers" t,
	 public."Subject" s,
	 public."Groups_lectures" gl
WHERE t.id = l.teacher_id
	  AND l.id = gl.lecture_id
	  AND l.subject_id= s.id
	  AND gl.group_id = g.id
	  AND l.lecture_room LIKE 'B103';