---task03---
---task03(a)---
drop role student_role;
create role student_role;
grant create session to student_role;
grant select on course to student_role;
grant select on Advisor_Selection to student_role;
---task03(b)---
drop role course_teacher;
create role course_teacher;
grant create session to course_teacher;
grant select on course to course_teacher;
grant select on student to course_teacher;
---task03(c)---
drop role head_dept;
create role head_dept;
grant create session to head_dept;
grant course_teacher to head_dept;
grant select on instructor to head_dept;
grant insert on instructor to head_dept;
---task03(d)---
drop role administrator;
create role administrator;
grant create session to administrator;
grant select on department to administrator;
grant select on instructor to administrator;
grant update(budget) on department to administrator;