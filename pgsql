Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:

psql (16.3)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=# \c atreyi09;
You are now connected to database "atreyi09" as user "postgres".
atreyi09=# \d student;
                              Table "public.student"
 Column |  Type   | Collation | Nullable |                 Default
--------+---------+-----------+----------+-----------------------------------------
 name   | text    |           |          |
 stu_id | integer |           | not null | nextval('student_stu_id_seq'::regclass)
 email  | text    |           | not null |
Indexes:
    "student_pkey" PRIMARY KEY, btree (stu_id)
Referenced by:
    TABLE "enrollment" CONSTRAINT "enrollment_stu_id_fkey" FOREIGN KEY (stu_id) REFERENCES student(stu_id)


atreyi09=# select * from student;
    name    | stu_id |         email
------------+--------+------------------------
 Atreyi Sen |      1 | atreyi.sen@example.com
 Bobo Brown |      2 | bobo.brown@example.com
 Soumya Das |      3 | soumya.das@example.com
(3 rows)


atreyi09=# INSERT INTO courses (course_name, course_code, credits) VALUES
atreyi09-# ('Database Systems', 'CS301', 3),
atreyi09-# ;
ERROR:  syntax error at or near ";"
LINE 3: ;
        ^
atreyi09=# insert into courses values('dsa',101,13),('oop',102,13);
ERROR:  invalid input syntax for type integer: "dsa"
LINE 1: insert into courses values('dsa',101,13),('oop',102,13);
                                   ^
atreyi09=# \d courses;
                 Table "public.courses"
   Column    |  Type   | Collation | Nullable | Default
-------------+---------+-----------+----------+---------
 course_id   | integer |           | not null |
 course_name | text    |           | not null |
 course_code | integer |           | not null |
 credits     | integer |           | not null |
Indexes:
    "courses_pkey" PRIMARY KEY, btree (course_id)
Referenced by:
    TABLE "enrollment" CONSTRAINT "enrollment_course_id_fkey" FOREIGN KEY (course_id) REFERENCES courses(course_id)


atreyi09=# insert into courses values(101,'dsa',11,13),(102,'oop',12,13);
INSERT 0 2
atreyi09=# select * from courses;
 course_id | course_name | course_code | credits
-----------+-------------+-------------+---------
       101 | dsa         |          11 |      13
       102 | oop         |          12 |      13
(2 rows)


atreyi09=# \d enrollement;
Did not find any relation named "enrollement".
atreyi09=# \d enrollment;
                                 Table "public.enrollment"
  Column   |  Type   | Collation | Nullable |                   Default
-----------+---------+-----------+----------+----------------------------------------------
 enrno_id  | integer |           | not null | nextval('enrollment_enrno_id_seq'::regclass)
 stu_id    | integer |           |          |
 course_id | integer |           |          |
Indexes:
    "enrollment_pkey" PRIMARY KEY, btree (enrno_id)
Foreign-key constraints:
    "enrollment_course_id_fkey" FOREIGN KEY (course_id) REFERENCES courses(course_id)
    "enrollment_stu_id_fkey" FOREIGN KEY (stu_id) REFERENCES student(stu_id)
Referenced by:
    TABLE "grades" CONSTRAINT "grades_enrollment_id_fkey" FOREIGN KEY (enrollment_id) REFERENCES enrollment(enrno_id)


atreyi09=# insert into enrollment(enrno_id)values(343),(123),(223);
INSERT 0 3
atreyi09=# select* from enrollment;
 enrno_id | stu_id | course_id
----------+--------+-----------
      343 |        |
      123 |        |
      223 |        |
(3 rows)


atreyi09=#
