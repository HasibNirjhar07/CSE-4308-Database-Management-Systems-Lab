Create TABLE Writer (
    writer_id NUMBER NOT null,
    w_name VARCHAR2(50) not null,
    contact_info NUMBER,
    experience VARCHAR2(50),
    CONSTRAINT PK_Writer PRIMARY key (writer_id)
)


Create Table Comics (
    comic_id int,
    comic_title VARCHAR2(20) not NULL,
    genre VARCHAR2(20),
    no_of_character int,
    summary TEXT,
    CONSTRAINT pk_comics primary key (comic_id),
    CONSTRAINT fk_comics_writer FOREIGN KEY(writer_id) REFERENCES Writer(writer_id) on delete CASCADE
)


create table coAuthors(
    coauthor_id int,
    writer_id number,
    comic_id int,
    CONSTRAINT pk_coAuthor PRIMARY key (coauthor_id),
    CONSTRAINT fk_coAuthor_writer foreign key(writer_id) REFERENCES Writer(writer_id) on delete CASCADE
    CONSTRAINT fk_coAuthor_Comics foreign key(comic_id) REFERENCES Comics(comic_id) on delete CASCADE
)


create table Reviewer(
    reviewer_id int,
    place VARCHAR2(20),
    age int,
    gender varchar2(10),
    CONSTRAINT pk_reviewer PRIMARY key (reviewer_id)
)



create table feedback(
    feedback_id int,
    comic_id int,
    reviewer_id int,
    rating int,
    comments text,
    CONSTRAINT Pk_feedback primary key (feedback_id),
    CONSTRAINT fk_feedback_Comics foreign key(comic_id) REFERENCES Comics(comic_id) on delete CASCADE,
    CONSTRAINT fk_reviewer_Comics foreign key(reviewer_id) REFERENCES Reviewer(reviewer_id) on delete CASCADE
)