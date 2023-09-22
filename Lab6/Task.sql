-- Task 1

CREATE VIEW ADVISOR_SELECTION AS
    SELECT
        ID,
        NAME,
        DEPT_NAME
    FROM
        INSTRUCTOR;

----Task 02---
create or replace view Student_Count
as
select max(Advisor_Selection.name) as advisor_name,
count(advisor.s_id) as student_count
from Advisor_Selection
left join advisor on Advisor_Selection.id=advisor.i_id
group by Advisor_Selection.id;


---task04---
---demonstrating task03(a)---
drop user s1;
create user s1 identified by ps1;
grant student_role to s1;
conn s1/ps1;
select * from N_210042170.Advisor_Selection;
select * from N_210042170.course;
drop table N_210042170.course;
--will give insufficient privileges error--
conn N_210042170/cse4308
---demonstrating task03(b)---
drop user c1;
create user c1 identified by ps2;
grant course_teacher to c1;
conn c1/ps2;
select * from N_210042170.student;
select * from N_210042170.course;
drop table N_210042170.course;
--will give insufficient privileges error--
conn N_210042170/cse4308
---demonstrating task03(c)---
drop user h1;
create user h1 identified by ps3;
grant head_dept to h1;
conn h1/ps3;
select * from N_210042170.student;
select * from N_210042170.course;
insert into N_210042170.instructor values
('24170', 'Nirjhar', 'Music', '456700');
drop table N_210042170.course;
--will give insufficient privileges error--
conn N_210042170/cse4308
---demonstrating task03(d)---
drop user a1;
create user a1 identified by ps4;
grant administrator to a1;
conn a1/ps4;
select * from N_210042170.department;
select * from N_210042170.instructor;
update N_210042170.department set
budget='150000' where dept_name='Music';
drop table N_210042170.department;
--will give insufficient privileges error--
conn N_210042170/cse4308