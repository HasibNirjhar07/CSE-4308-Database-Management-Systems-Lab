CREATE TABLE INSTRUCTOR 
(
    ID INT NOT NULL,
    NAME VARCHAR(100) NOT NULL,
    DEPT_NAME VARCHAR(100) NOT NULL,
    SALARY INT NOT NULL,
    Constraint PK_INSTRUCTOR PRIMARY KEY (ID),
    constraint salary_check check (salary > 20000)
);