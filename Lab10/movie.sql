DROP TABLE MTYPE CASCADE CONSTRAINTS;
DROP TABLE RATING CASCADE CONSTRAINTS;
DROP TABLE DIRECTION CASCADE CONSTRAINTS;
DROP TABLE CASTS CASCADE CONSTRAINTS;
DROP TABLE GENRES CASCADE CONSTRAINTS;
DROP TABLE MOVIE CASCADE CONSTRAINTS;
DROP TABLE REVIEWER CASCADE CONSTRAINTS;
DROP TABLE DIRECTOR CASCADE CONSTRAINTS;
DROP TABLE ACTOR CASCADE CONSTRAINTS;

CREATE TABLE ACTOR
(
    ACT_ID NUMBER,
    ACT_FIRSTNAME VARCHAR2(20),
    ACT_LASTNAME VARCHAR2(20),
    ACT_GENDER VARCHAR2(1),
    CONSTRAINT PK_ACTOR PRIMARY KEY(ACT_ID)
);

CREATE TABLE DIRECTOR
(
    DIR_ID NUMBER,
    DIR_FIRSTNAME VARCHAR2(20),
    DIR_LASTNAME VARCHAR2(20),
    CONSTRAINT PK_DIRECTOR PRIMARY KEY(DIR_ID)
);

CREATE TABLE REVIEWER
(
    REV_ID NUMBER,
    REV_NAME VARCHAR2(30),
    CONSTRAINT PK_REVIEWER PRIMARY KEY(REV_ID)
);

CREATE TABLE MOVIE
(
    MOV_ID NUMBER,
    MOV_TITLE VARCHAR2(50),
    MOV_YEAR NUMBER,
    MOV_TIME NUMBER,
    MOV_LANGUAGE VARCHAR2(30),
    MOV_RELEASEDATE DATE,
    MOV_COUNTRY VARCHAR2(30),
    CONSTRAINT PK_MOVIE PRIMARY KEY(MOV_ID)
);

CREATE TABLE GENRES
(
    GEN_ID NUMBER,
    GEN_TITLE VARCHAR2(20),
    CONSTRAINT PK_GENRES PRIMARY KEY(GEN_ID)
);

CREATE TABLE CASTS
(
    ACT_ID NUMBER,
    MOV_ID NUMBER,
    ROLE VARCHAR2(30),
    CONSTRAINT PK_CASTS PRIMARY KEY(ACT_ID, MOV_ID),
    CONSTRAINT FK_CASTS_ACTOR FOREIGN KEY(ACT_ID) REFERENCES ACTOR(ACT_ID),
    CONSTRAINT FK_CASTS_MOVIE FOREIGN KEY(MOV_ID) REFERENCES MOVIE(MOV_ID)
);

CREATE TABLE DIRECTION
(
    DIR_ID NUMBER,
    MOV_ID NUMBER,
    CONSTRAINT PK_DIRECTIONS PRIMARY KEY(DIR_ID, MOV_ID),
    CONSTRAINT FK_DIRECTION_DIRECTOR FOREIGN KEY(DIR_ID) REFERENCES DIRECTOR(DIR_ID),
    CONSTRAINT FK_DIRECTION_MOVIE FOREIGN KEY(MOV_ID) REFERENCES MOVIE(MOV_ID)
);

CREATE TABLE RATING
(
    MOV_ID NUMBER,
    REV_ID NUMBER,
    REV_STARS NUMBER,
    CONSTRAINT PK_RATING PRIMARY KEY(MOV_ID, REV_ID),
    CONSTRAINT FK_RATING_MOVIE FOREIGN KEY(MOV_ID) REFERENCES MOVIE(MOV_ID),
    CONSTRAINT FK_RATING_REVIEWER FOREIGN KEY(REV_ID) REFERENCES REVIEWER(REV_ID)
);

CREATE TABLE MTYPE
(
    MOV_ID NUMBER,
    GEN_ID NUMBER,
    CONSTRAINT PK_MTYPE PRIMARY KEY(MOV_ID, GEN_ID),
    CONSTRAINT FK_MTYPE_MOVIE FOREIGN KEY(MOV_ID) REFERENCES MOVIE(MOV_ID),
    CONSTRAINT FK_MTYPE_GENRES FOREIGN KEY(GEN_ID) REFERENCES GENRES(GEN_ID)
);

INSERT INTO DIRECTOR VALUES(201, 'Alfred',                'Hitchcock');
INSERT INTO DIRECTOR VALUES(202, 'Jack',                  'Clayton');
INSERT INTO DIRECTOR VALUES(203, 'David',                 'Lean');
INSERT INTO DIRECTOR VALUES(204, 'Michael',               'Cimino');
INSERT INTO DIRECTOR VALUES(205, 'Milos',                 'Forman');
INSERT INTO DIRECTOR VALUES(206, 'Ridley',                'Scott');
INSERT INTO DIRECTOR VALUES(207, 'Stanley',               'Kubrick');
INSERT INTO DIRECTOR VALUES(208, 'Bryan',                 'Singer');
INSERT INTO DIRECTOR VALUES(209, 'Roman',                 'Polanski');
INSERT INTO DIRECTOR VALUES(210, 'Paul',                  'Thomas Anderson');
INSERT INTO DIRECTOR VALUES(211, 'Woody',                 'Allen');
INSERT INTO DIRECTOR VALUES(212, 'Hayao',                 'Miyazaki');
INSERT INTO DIRECTOR VALUES(213, 'Frank',                 'Darabont');
INSERT INTO DIRECTOR VALUES(214, 'Sam',                   'Mendes');
INSERT INTO DIRECTOR VALUES(215, 'James',                 'Cameron');
INSERT INTO DIRECTOR VALUES(216, 'Gus',                   'Van Sant');
INSERT INTO DIRECTOR VALUES(217, 'John',                  'Boorman');
INSERT INTO DIRECTOR VALUES(218, 'Danny',                 'Boyle');
INSERT INTO DIRECTOR VALUES(219, 'Christopher',           'Nolan');
INSERT INTO DIRECTOR VALUES(220, 'Richard',               'Kelly');
INSERT INTO DIRECTOR VALUES(221, 'Kevin',                 'Spacey');
INSERT INTO DIRECTOR VALUES(222, 'Andrei',                'Tarkovsky');
INSERT INTO DIRECTOR VALUES(223, 'Peter',                 'Jackson');
INSERT INTO DIRECTOR VALUES(224, 'James',                 'Marsh');
INSERT INTO DIRECTOR VALUES(225, 'Raoul',                 'Walsh');
INSERT INTO DIRECTOR VALUES(226, 'Susan',                'Johnson');
INSERT INTO DIRECTOR VALUES(227, 'Orson',                'Welles');
INSERT INTO GENRES VALUES(1001, 'Action');
INSERT INTO GENRES VALUES(1002, 'Adventure');
INSERT INTO GENRES VALUES(1003, 'Animation');
INSERT INTO GENRES VALUES(1004, 'Biography');
INSERT INTO GENRES VALUES(1005, 'Comedy');
INSERT INTO GENRES VALUES(1006, 'Crime');
INSERT INTO GENRES VALUES(1007, 'Drama');
INSERT INTO GENRES VALUES(1008, 'Horror');
INSERT INTO GENRES VALUES(1009, 'Music');
INSERT INTO GENRES VALUES(1010, 'Mystery');
INSERT INTO GENRES VALUES(1011, 'Romance');
INSERT INTO GENRES VALUES(1012, 'Thriller');
INSERT INTO GENRES VALUES(1013, 'War');
INSERT INTO ACTOR VALUES(101, 'James'               , 'Stewart'             , 'M');
INSERT INTO ACTOR VALUES(102, 'Deborah'             , 'Kerr'                , 'F');
INSERT INTO ACTOR VALUES(103, 'Peter'               , 'OToole'              , 'M');
INSERT INTO ACTOR VALUES(104, 'Robert'              , 'De Niro'             , 'M');
INSERT INTO ACTOR VALUES(105, 'F. Murray'           , 'Abraham'             , 'M');
INSERT INTO ACTOR VALUES(106, 'Harrison'            , 'Ford'                , 'M');
INSERT INTO ACTOR VALUES(107, 'Nicole'              , 'Kidman'              , 'F');
INSERT INTO ACTOR VALUES(108, 'Stephen'             , 'Baldwin'             , 'M');
INSERT INTO ACTOR VALUES(109, 'Jack'                , 'Nicholson'           , 'M');
INSERT INTO ACTOR VALUES(110, 'Mark'                , 'Wahlberg'            , 'M');
INSERT INTO ACTOR VALUES(111, 'Woody'               , 'Allen'               , 'M');
INSERT INTO ACTOR VALUES(112, 'Claire'              , 'Danes'               , 'F');
INSERT INTO ACTOR VALUES(113, 'Tim'                 , 'Robbins'             , 'M');
INSERT INTO ACTOR VALUES(114, 'Kevin'               , 'Spacey'              , 'M');
INSERT INTO ACTOR VALUES(115, 'Kate'                , 'Winslet'             , 'F');
INSERT INTO ACTOR VALUES(116, 'Robin'               , 'Williams'            , 'M');
INSERT INTO ACTOR VALUES(117, 'Jon'                 , 'Voight'              , 'M');
INSERT INTO ACTOR VALUES(118, 'Ewan'                , 'McGregor'            , 'M');
INSERT INTO ACTOR VALUES(119, 'Christian'           , 'Bale'                , 'M');
INSERT INTO ACTOR VALUES(120, 'Maggie'              , 'Gyllenhaal'          , 'F');
INSERT INTO ACTOR VALUES(121, 'Dev'                 , 'Patel'               , 'M');
INSERT INTO ACTOR VALUES(122, 'Sigourney'           , 'Weaver'              , 'F');
INSERT INTO ACTOR VALUES(123, 'David'               , 'Aston'               , 'M');
INSERT INTO ACTOR VALUES(124, 'Ali'                 , 'Astin'               , 'F');
INSERT INTO ACTOR VALUES(125, 'Al'                  , 'Pacino'              , 'M');
INSERT INTO ACTOR VALUES(126, 'Kate'                , 'Mara'                , 'F');
INSERT INTO ACTOR VALUES(127, 'Jackie'              , 'Chan'                , 'M');
INSERT INTO ACTOR VALUES(128, 'Jennifer'            , 'Aniston'             , 'F');
INSERT INTO ACTOR VALUES(129, 'Jennifer'            , 'Garner'              , 'F');
INSERT INTO ACTOR VALUES(130, 'Robert'              , 'Duvall'              , 'M');
INSERT INTO ACTOR VALUES(131, 'Eddie'               , 'Redmayne'            , 'M');
INSERT INTO ACTOR VALUES(132, 'Felicity'            , 'Jones'               , 'F');
INSERT INTO ACTOR VALUES(133, 'George'              , 'Raft'                , 'M');
INSERT INTO ACTOR VALUES(134, 'Lana'                , 'Condor'              , 'F');
INSERT INTO ACTOR VALUES(135, 'Orson'               , 'Welles'              , 'M');
INSERT INTO ACTOR VALUES(136, 'Shelley'             , 'Duvall'              , 'F');

INSERT INTO MOVIE VALUES(901 , 'Vertigo',                                           1958,      128, 'English',          TO_DATE('1958-08-24', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(902 , 'The Innocents',                                     1961,      100, 'English',          TO_DATE('1962-02-19', 'YYYY-MM-DD'), 'SW');
INSERT INTO MOVIE VALUES(903 , 'Lawrence of Arabia',                                1962,      216, 'English',          TO_DATE('1962-12-11', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(904 , 'The Deer Hunter',                                   1978,      183, 'English',          TO_DATE('1979-03-08', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(905 , 'Amadeus',                                           1984,      160, 'English',          TO_DATE('1985-01-07', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(906 , 'Blade Runner',                                      1982,      117, 'English',          TO_DATE('1982-09-09', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(907 , 'Eyes Wide Shut',                                    1999,      159, 'English',          NULL  , 'UK');
INSERT INTO MOVIE VALUES(908 , 'The Usual Suspects',                                1995,      106, 'English',          TO_DATE('1995-08-25', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(909 , 'Chinatown',                                         1974,      130, 'English',          TO_DATE('1974-08-09', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(910 , 'Boogie Nights',                                     1997,      155, 'English',          TO_DATE('1998-02-16', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(911 , 'Annie Hall',                                        1977,       93, 'English',          TO_DATE('1977-04-20', 'YYYY-MM-DD'), 'USA');
INSERT INTO MOVIE VALUES(912 , 'Princess Mononoke',                                 1997,      134, 'Japanese',         TO_DATE('2001-10-19', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(913 , 'The Shawshank Redemption',                          1994,      142, 'English',          TO_DATE('1995-02-17', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(914 , 'American Beauty',                                   1999,      122, 'English',          NULL         , 'UK');
INSERT INTO MOVIE VALUES(915 , 'Titanic',                                           1997,      194, 'English',          TO_DATE('1998-01-23', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(916 , 'Good Will Hunting',                                 1997,      126, 'English',          TO_DATE('1998-06-03', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(917 , 'Deliverance',                                       1972,      109, 'English',          TO_DATE('1982-10-05', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(918 , 'Trainspotting',                                     1996,       94, 'English',          TO_DATE('1996-02-23', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(919 , 'The Prestige',                                      2006,      130, 'English',          TO_DATE('2006-11-10', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(920 , 'Donnie Darko',                                      2001,      113, 'English',          NULL         , 'UK');
INSERT INTO MOVIE VALUES(921 , 'Slumdog Millionaire',                               2008,      120, 'English',          TO_DATE('2009-01-09', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(922 , 'Aliens',                                            1986,      137, 'English',          TO_DATE('1986-08-29', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(923 , 'Beyond the Sea',                                    2004,      118, 'English',          TO_DATE('2004-11-26', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(924 , 'Avatar',                                            2009,      162, 'English',          TO_DATE('2009-12-17', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(926 , 'Seven Samurai',                                     1954,      207, 'Japanese',         TO_DATE('1954-04-26', 'YYYY-MM-DD'), 'JP');
INSERT INTO MOVIE VALUES(927 , 'Spirited Away',                                     2001,      125, 'Japanese',         TO_DATE('2003-09-12', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(928 , 'Back to the Future',                                1985,      116, 'English',          TO_DATE('1985-12-04', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(925 , 'Braveheart',                                        1995,      178, 'English',          TO_DATE('1995-09-08', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(929 , 'The Theory of Everything',                          2014,      123, 'English',          TO_DATE('2014-11-07', 'YYYY-MM-DD'), 'UK');
INSERT INTO MOVIE VALUES(930 , 'They Drive by Night',                               1940,      95,  'English',          TO_DATE('1940-08-03', 'YYYY-MM-DD'), 'USA');
INSERT INTO MOVIE VALUES(931 , 'To All the Boys I''ve Loved Before',                2018,      99,  'English',          TO_DATE('2018-08-17', 'YYYY-MM-DD'), 'USA');
INSERT INTO MOVIE VALUES(932 , 'Citizen Kane',                                      1941,      119, 'English',          TO_DATE('1941-09-05', 'YYYY-MM-DD'), 'USA');
INSERT INTO MOVIE VALUES(933 , 'The Shining',                                       1980,      146,  'English',         TO_DATE('1980-05-23', 'YYYY-MM-DD'), 'USA');
INSERT INTO REVIEWER VALUES(9001, 'Righty Sock');
INSERT INTO REVIEWER VALUES(9002, 'Jack Malvern');
INSERT INTO REVIEWER VALUES(9003, 'Flagrant Baronessa');
INSERT INTO REVIEWER VALUES(9004, 'Alec Shaw');
INSERT INTO REVIEWER VALUES(9005, NULL);
INSERT INTO REVIEWER VALUES(9006, 'Victor Woeltjen');
INSERT INTO REVIEWER VALUES(9007, 'Simon Wright');
INSERT INTO REVIEWER VALUES(9008, 'Neal Wruck');
INSERT INTO REVIEWER VALUES(9009, 'Paul Monks');
INSERT INTO REVIEWER VALUES(9010, 'Mike Salvati');
INSERT INTO REVIEWER VALUES(9011, NULL);
INSERT INTO REVIEWER VALUES(9012, 'Wesley S. Walker');
INSERT INTO REVIEWER VALUES(9013, 'Sasha Goldshtein');
INSERT INTO REVIEWER VALUES(9014, 'Josh Cates');
INSERT INTO REVIEWER VALUES(9015, 'Krug Stillo');
INSERT INTO REVIEWER VALUES(9016, 'Scott LeBrun');
INSERT INTO REVIEWER VALUES(9017, 'Hannah Steele');
INSERT INTO REVIEWER VALUES(9018, 'Vincent Cadena');
INSERT INTO REVIEWER VALUES(9019, 'Brandt Sponseller');
INSERT INTO REVIEWER VALUES(9020, 'Richard Adams');
INSERT INTO DIRECTION VALUES(201, 901);
INSERT INTO DIRECTION VALUES(202, 902);
INSERT INTO DIRECTION VALUES(203, 903);
INSERT INTO DIRECTION VALUES(204, 904);
INSERT INTO DIRECTION VALUES(205, 905);
INSERT INTO DIRECTION VALUES(206, 906);
INSERT INTO DIRECTION VALUES(207, 907);
INSERT INTO DIRECTION VALUES(208, 908);
INSERT INTO DIRECTION VALUES(209, 909);
INSERT INTO DIRECTION VALUES(210, 910);
INSERT INTO DIRECTION VALUES(211, 911);
INSERT INTO DIRECTION VALUES(212, 912);
INSERT INTO DIRECTION VALUES(213, 913);
INSERT INTO DIRECTION VALUES(214, 914);
INSERT INTO DIRECTION VALUES(215, 915);
INSERT INTO DIRECTION VALUES(216, 916);
INSERT INTO DIRECTION VALUES(217, 917);
INSERT INTO DIRECTION VALUES(218, 918);
INSERT INTO DIRECTION VALUES(219, 919);
INSERT INTO DIRECTION VALUES(220, 920);
INSERT INTO DIRECTION VALUES(218, 921);
INSERT INTO DIRECTION VALUES(215, 922);
INSERT INTO DIRECTION VALUES(221, 923);
INSERT INTO DIRECTION VALUES(224, 929);
INSERT INTO DIRECTION VALUES(225, 930);
INSERT INTO DIRECTION VALUES(226, 931);
INSERT INTO DIRECTION VALUES(227, 932);
INSERT INTO DIRECTION VALUES(207, 933);
INSERT INTO CASTS VALUES(101, 901, 'John Scottie Ferguson');
INSERT INTO CASTS VALUES(134, 931, 'Lara Jean Covey');
INSERT INTO CASTS VALUES(102, 902, 'Miss Giddens');
INSERT INTO CASTS VALUES(103, 903, 'T.E. Lawrence');
INSERT INTO CASTS VALUES(104, 904, 'Michael');
INSERT INTO CASTS VALUES(105, 905, 'Antonio Salieri');
INSERT INTO CASTS VALUES(106, 906, 'Rick Deckard');
INSERT INTO CASTS VALUES(107, 907, 'Alice Harford');
INSERT INTO CASTS VALUES(108, 908, 'McManus');
INSERT INTO CASTS VALUES(110, 910, 'Eddie Adams');
INSERT INTO CASTS VALUES(111, 911, 'Alvy Singer');
INSERT INTO CASTS VALUES(112, 912, 'San');
INSERT INTO CASTS VALUES(113, 913, 'Andy Dufresne');
INSERT INTO CASTS VALUES(114, 914, 'Lester Burnham');
INSERT INTO CASTS VALUES(115, 915, 'Rose DeWitt Bukater');
INSERT INTO CASTS VALUES(116, 916, 'Sean Maguire');
INSERT INTO CASTS VALUES(117, 917, 'Ed');
INSERT INTO CASTS VALUES(118, 918, 'Renton');
INSERT INTO CASTS VALUES(120, 920, 'Elizabeth Darko');
INSERT INTO CASTS VALUES(121, 921, 'Older Jamal');
INSERT INTO CASTS VALUES(122, 922, 'Ripley');
INSERT INTO CASTS VALUES(114, 923, 'Bobby Darin');
INSERT INTO CASTS VALUES(109, 909, 'J.J. Gittes');
INSERT INTO CASTS VALUES(119, 919, 'Alfred Borden');
INSERT INTO CASTS VALUES(131, 929, 'Stephen Hawking');
INSERT INTO CASTS VALUES(132, 929, 'Jane Hawking');
INSERT INTO CASTS VALUES(133, 930, 'Joe Fabrini');
INSERT INTO CASTS VALUES(135, 932, 'Kane');
INSERT INTO CASTS VALUES(136, 933, 'Wendy Torrance');
INSERT INTO RATING VALUES(913, 9018, 5);
INSERT INTO RATING VALUES(927, 9018, 10);
INSERT INTO RATING VALUES(927, 9020, 9);
INSERT INTO RATING VALUES(908, 9020, 10);
INSERT INTO RATING VALUES(921, 9001, 7);
INSERT INTO RATING VALUES(913, 9005, 10);
INSERT INTO RATING VALUES(910, 9013, 3);
INSERT INTO RATING VALUES(902, 9013, 9);
INSERT INTO RATING VALUES(906, 9008, 4);
INSERT INTO RATING VALUES(904, 9012, 6);
INSERT INTO RATING VALUES(907, 9001, 6);
INSERT INTO RATING VALUES(906, 9001, 7);
INSERT INTO RATING VALUES(917, 9015, 6);
INSERT INTO RATING VALUES(917, 9001, 6);
INSERT INTO RATING VALUES(918, 9016, 6);
INSERT INTO RATING VALUES(918, 9012, 6);
INSERT INTO RATING VALUES(913, 9020, 10);
INSERT INTO RATING VALUES(916, 9015, 8);
INSERT INTO RATING VALUES(902, 9010, 6);
INSERT INTO RATING VALUES(917, 9014, 7);
INSERT INTO RATING VALUES(903, 9020, 6);
INSERT INTO RATING VALUES(918, 9005, 8);
INSERT INTO RATING VALUES(907, 9008, 9);
INSERT INTO RATING VALUES(901, 9020, 5);
INSERT INTO RATING VALUES(918, 9007, 6);
INSERT INTO RATING VALUES(918, 9002, 9);
INSERT INTO RATING VALUES(916, 9004, 5);
INSERT INTO RATING VALUES(909, 9020, 6);
INSERT INTO RATING VALUES(917, 9006, 8);
INSERT INTO RATING VALUES(909, 9006, 10);
INSERT INTO RATING VALUES(916, 9001, 9);
INSERT INTO RATING VALUES(902, 9007, 5);
INSERT INTO RATING VALUES(914, 9015, 8);
INSERT INTO RATING VALUES(918, 9011, 8);
INSERT INTO RATING VALUES(904, 9005, 5);
INSERT INTO RATING VALUES(925, 9013, 7);
INSERT INTO RATING VALUES(910, 9003, 6);
INSERT INTO RATING VALUES(902, 9012, 9);
INSERT INTO RATING VALUES(909, 9004, 7);
INSERT INTO RATING VALUES(915, 9001, 9);
INSERT INTO RATING VALUES(905, 9018, 5);
INSERT INTO RATING VALUES(925, 9008, 10);
INSERT INTO RATING VALUES(918, 9015, 4);
INSERT INTO RATING VALUES(908, 9016, 2);
INSERT INTO RATING VALUES(912, 9009, 5);
INSERT INTO RATING VALUES(918, 9010, 6);
INSERT INTO RATING VALUES(907, 9016, 9);
INSERT INTO RATING VALUES(920, 9015, 7);
INSERT INTO RATING VALUES(921, 9004, 6);
INSERT INTO RATING VALUES(912, 9016, 1);
INSERT INTO RATING VALUES(901, 9004, 7);
INSERT INTO RATING VALUES(916, 9012, 8);
INSERT INTO RATING VALUES(911, 9006, 9);
INSERT INTO RATING VALUES(910, 9001, 7);
INSERT INTO RATING VALUES(901, 9006, 6);
INSERT INTO RATING VALUES(923, 9018, 7);
INSERT INTO RATING VALUES(913, 9013, 10);
INSERT INTO RATING VALUES(914, 9017, 7);
INSERT INTO RATING VALUES(905, 9011, 9);
INSERT INTO RATING VALUES(920, 9012, 5);
INSERT INTO RATING VALUES(915, 9004, 6);
INSERT INTO RATING VALUES(923, 9009, 7);
INSERT INTO RATING VALUES(925, 9007, 10);
INSERT INTO RATING VALUES(905, 9020, 8);
INSERT INTO RATING VALUES(925, 9012, 9);
INSERT INTO RATING VALUES(909, 9007, 6);
INSERT INTO RATING VALUES(908, 9011, 4);
INSERT INTO RATING VALUES(917, 9010, 6);
INSERT INTO RATING VALUES(912, 9013, 5);
INSERT INTO RATING VALUES(923, 9012, 3);
INSERT INTO RATING VALUES(917, 9002, 7);
INSERT INTO RATING VALUES(923, 9016, 6);
INSERT INTO RATING VALUES(919, 9003, 7);
INSERT INTO RATING VALUES(923, 9005, 7);
INSERT INTO RATING VALUES(916, 9017, 9);
INSERT INTO RATING VALUES(906, 9010, 9);
INSERT INTO RATING VALUES(908, 9010, 7);
INSERT INTO RATING VALUES(903, 9016, 7);
INSERT INTO RATING VALUES(902, 9008, 9);
INSERT INTO RATING VALUES(920, 9011, 6);
INSERT INTO RATING VALUES(924, 9014, 7);
INSERT INTO RATING VALUES(908, 9007, 5);
INSERT INTO RATING VALUES(913, 9006, 10);
INSERT INTO RATING VALUES(917, 9005, 10);
INSERT INTO RATING VALUES(906, 9007, 3);
INSERT INTO RATING VALUES(918, 9013, 8);
INSERT INTO RATING VALUES(901, 9001, 8);
INSERT INTO RATING VALUES(915, 9013, 10);
INSERT INTO RATING VALUES(908, 9017, 6);
INSERT INTO RATING VALUES(922, 9016, 6);
INSERT INTO RATING VALUES(909, 9002, 6);
INSERT INTO RATING VALUES(915, 9008, 6);
INSERT INTO RATING VALUES(903, 9012, 9);
INSERT INTO RATING VALUES(910, 9010, 5);
INSERT INTO RATING VALUES(901, 9019, 6);
INSERT INTO RATING VALUES(909, 9018, 10);
INSERT INTO RATING VALUES(907, 9011, 7);
INSERT INTO RATING VALUES(920, 9004, 3);
INSERT INTO RATING VALUES(920, 9014, 5);
INSERT INTO RATING VALUES(903, 9004, 8);
INSERT INTO RATING VALUES(922, 9004, 3);
INSERT INTO RATING VALUES(919, 9011, 7);
INSERT INTO RATING VALUES(911, 9020, 8);
INSERT INTO RATING VALUES(910, 9002, 5);
INSERT INTO RATING VALUES(912, 9020, 10);
INSERT INTO RATING VALUES(909, 9019, 9);
INSERT INTO RATING VALUES(921, 9015, 5);
INSERT INTO RATING VALUES(905, 9008, 10);
INSERT INTO RATING VALUES(922, 9017, 8);
INSERT INTO RATING VALUES(918, 9020, 3);
INSERT INTO RATING VALUES(915, 9014, 3);
INSERT INTO RATING VALUES(910, 9019, 7);
INSERT INTO RATING VALUES(914, 9014, 9);
INSERT INTO RATING VALUES(914, 9001, 6);
INSERT INTO RATING VALUES(922, 9003, 8);
INSERT INTO RATING VALUES(917, 9007, 8);
INSERT INTO RATING VALUES(918, 9014, 5);
INSERT INTO RATING VALUES(924, 9007, 6);
INSERT INTO RATING VALUES(915, 9017, 10);
INSERT INTO RATING VALUES(903, 9003, 5);
INSERT INTO RATING VALUES(901, 9009, 7);
INSERT INTO RATING VALUES(920, 9007, 7);
INSERT INTO RATING VALUES(914, 9005, 3);
INSERT INTO RATING VALUES(921, 9010, 5);
INSERT INTO RATING VALUES(910, 9012, 6);
INSERT INTO RATING VALUES(913, 9014, 8);
INSERT INTO RATING VALUES(901, 9002, 4);
INSERT INTO RATING VALUES(915, 9002, 5);
INSERT INTO RATING VALUES(920, 9018, 8);
INSERT INTO RATING VALUES(913, 9009, 10);
INSERT INTO RATING VALUES(905, 9010, 7);
INSERT INTO RATING VALUES(918, 9003, 7);
INSERT INTO RATING VALUES(909, 9003, NULL);
INSERT INTO RATING VALUES(914, 9004, NULL);
INSERT INTO RATING VALUES(912, 9018, 7);
INSERT INTO RATING VALUES(913, 9002, 9);
INSERT INTO RATING VALUES(921, 9013, 3);
INSERT INTO RATING VALUES(906, 9011, 8);
INSERT INTO RATING VALUES(911, 9010, 10);
INSERT INTO RATING VALUES(915, 9006, NULL);
INSERT INTO RATING VALUES(922, 9009, 5);
INSERT INTO RATING VALUES(925, 9019, 6);
INSERT INTO RATING VALUES(911, 9004, 8);
INSERT INTO RATING VALUES(916, 9018, 8);
INSERT INTO RATING VALUES(909, 9017, 7);
INSERT INTO RATING VALUES(907, 9005, 6);
INSERT INTO RATING VALUES(905, 9005, 5);
INSERT INTO RATING VALUES(915, 9016, 9);
INSERT INTO RATING VALUES(906, 9004, 6);
INSERT INTO RATING VALUES(902, 9004, 7);
INSERT INTO RATING VALUES(911, 9019, 4);
INSERT INTO RATING VALUES(918, 9008, 7);
INSERT INTO RATING VALUES(920, 9003, 7);
INSERT INTO RATING VALUES(914, 9013, 6);
INSERT INTO RATING VALUES(925, 9009, 8);
INSERT INTO RATING VALUES(905, 9009, 6);
INSERT INTO RATING VALUES(904, 9003, 5);
INSERT INTO RATING VALUES(921, 9012, NULL);
INSERT INTO RATING VALUES(923, 9008, NULL);
INSERT INTO RATING VALUES(922, 9011, 7);
INSERT INTO RATING VALUES(907, 9006, 7);
INSERT INTO RATING VALUES(924, 9003, 8);
INSERT INTO RATING VALUES(905, 9006, 4);
INSERT INTO RATING VALUES(910, 9017, 6);
INSERT INTO RATING VALUES(904, 9010, 9);
INSERT INTO RATING VALUES(912, 9005, 10);
INSERT INTO RATING VALUES(920, 9002, 6);
INSERT INTO RATING VALUES(904, 9002, 4);
INSERT INTO RATING VALUES(912, 9011, 6);
INSERT INTO RATING VALUES(916, 9014, 5);
INSERT INTO RATING VALUES(914, 9008, 6);
INSERT INTO RATING VALUES(904, 9006, 6);
INSERT INTO RATING VALUES(903, 9001, 8);
INSERT INTO RATING VALUES(903, 9014, 7);
INSERT INTO RATING VALUES(912, 9017, 8);
INSERT INTO RATING VALUES(903, 9006, 5);
INSERT INTO RATING VALUES(922, 9006, NULL);
INSERT INTO RATING VALUES(902, 9011, 8);
INSERT INTO RATING VALUES(902, 9018, NULL);
INSERT INTO RATING VALUES(922, 9010, 2);
INSERT INTO RATING VALUES(916, 9020, 8);
INSERT INTO RATING VALUES(902, 9015, 5);
INSERT INTO RATING VALUES(922, 9005, 7);
INSERT INTO RATING VALUES(920, 9013, 3);
INSERT INTO RATING VALUES(916, 9011, 10);
INSERT INTO RATING VALUES(911, 9014, 10);
INSERT INTO RATING VALUES(915, 9003, 8);
INSERT INTO RATING VALUES(906, 9014, 6);
INSERT INTO RATING VALUES(908, 9014, 6);
INSERT INTO RATING VALUES(913, 9011, 9);
INSERT INTO RATING VALUES(915, 9011, 8);
INSERT INTO RATING VALUES(922, 9002, 10);
INSERT INTO RATING VALUES(913, 9016, 8);
INSERT INTO RATING VALUES(916, 9007, 7);
INSERT INTO RATING VALUES(913, 9017, 5);
INSERT INTO RATING VALUES(911, 9013, 5);
INSERT INTO RATING VALUES(907, 9007, 9);
INSERT INTO RATING VALUES(911, 9001, 7);
INSERT INTO RATING VALUES(911, 9017, 6);
INSERT INTO RATING VALUES(921, 9007, 4);
INSERT INTO RATING VALUES(911, 9009, 8);
INSERT INTO RATING VALUES(907, 9014, 6);
INSERT INTO RATING VALUES(910, 9011, 10);
INSERT INTO RATING VALUES(908, 9009, 5);
INSERT INTO RATING VALUES(920, 9010, 10);
INSERT INTO RATING VALUES(906, 9012, 9);
INSERT INTO RATING VALUES(907, 9015, 8);
INSERT INTO RATING VALUES(924, 9015, 10);
INSERT INTO RATING VALUES(917, 9004, 7);
INSERT INTO RATING VALUES(916, 9002, 7);
INSERT INTO RATING VALUES(924, 9002, 8);
INSERT INTO RATING VALUES(908, 9018, 9);
INSERT INTO RATING VALUES(920, 9005, 4);
INSERT INTO RATING VALUES(919, 9018, 5);
INSERT INTO RATING VALUES(904, 9019, 6);
INSERT INTO RATING VALUES(922, 9018, 3);
INSERT INTO RATING VALUES(905, 9014, 5);
INSERT INTO RATING VALUES(912, 9003, 5);
INSERT INTO RATING VALUES(916, 9019, 6);
INSERT INTO RATING VALUES(923, 9001, 6);
INSERT INTO RATING VALUES(919, 9012, 4);
INSERT INTO RATING VALUES(919, 9014, 8);
INSERT INTO RATING VALUES(921, 9018, 5);
INSERT INTO RATING VALUES(918, 9001, 7);
INSERT INTO RATING VALUES(922, 9001, 10);
INSERT INTO RATING VALUES(923, 9011, 7);
INSERT INTO RATING VALUES(906, 9016, 6);
INSERT INTO RATING VALUES(917, 9011, 7);
INSERT INTO RATING VALUES(911, 9002, 4);
INSERT INTO RATING VALUES(912, 9012, 8);
INSERT INTO RATING VALUES(913, 9019, 6);
INSERT INTO RATING VALUES(906, 9015, 8);
INSERT INTO RATING VALUES(922, 9008, 8);
INSERT INTO RATING VALUES(910, 9005, 5);
INSERT INTO RATING VALUES(916, 9013, 7);
INSERT INTO RATING VALUES(922, 9007, 8);
INSERT INTO RATING VALUES(920, 9001, 6);
INSERT INTO RATING VALUES(925, 9015, 7);
INSERT INTO RATING VALUES(922, 9012, 9);
INSERT INTO RATING VALUES(924, 9005, 6);
INSERT INTO RATING VALUES(906, 9006, 4);
INSERT INTO RATING VALUES(916, 9009, 7);
INSERT INTO RATING VALUES(916, 9003, NULL);
INSERT INTO RATING VALUES(923, 9006, 5);
INSERT INTO RATING VALUES(908, 9005, 7);
INSERT INTO RATING VALUES(923, 9002, 5);
INSERT INTO RATING VALUES(903, 9005, 7);
INSERT INTO RATING VALUES(921, 9016, 4);
INSERT INTO RATING VALUES(919, 9005, 8);
INSERT INTO RATING VALUES(924, 9010, NULL);
INSERT INTO RATING VALUES(921, 9006, 7);
INSERT INTO RATING VALUES(908, 9013, 7);
INSERT INTO RATING VALUES(925, 9005, 9);
INSERT INTO RATING VALUES(908, 9012, 5);
INSERT INTO RATING VALUES(911, 9003, 3);
INSERT INTO RATING VALUES(904, 9016, 8);
INSERT INTO RATING VALUES(915, 9018, 7);
INSERT INTO RATING VALUES(911, 9018, 5);
INSERT INTO RATING VALUES(905, 9016, NULL);
INSERT INTO RATING VALUES(903, 9008, NULL);
INSERT INTO RATING VALUES(915, 9010, 6);
INSERT INTO RATING VALUES(915, 9020, 5);
INSERT INTO RATING VALUES(905, 9002, 10);
INSERT INTO RATING VALUES(906, 9003, 5);
INSERT INTO RATING VALUES(908, 9019, 6);
INSERT INTO RATING VALUES(906, 9005, 6);
INSERT INTO RATING VALUES(907, 9017, 4);
INSERT INTO RATING VALUES(909, 9001, 5);
INSERT INTO RATING VALUES(904, 9014, 7);
INSERT INTO RATING VALUES(902, 9017, 4);
INSERT INTO RATING VALUES(901, 9011, 8);
INSERT INTO RATING VALUES(914, 9006, 4);
INSERT INTO RATING VALUES(901, 9008, 9);
INSERT INTO RATING VALUES(918, 9017, 6);
INSERT INTO RATING VALUES(905, 9017, 9);
INSERT INTO RATING VALUES(917, 9009, 8);
INSERT INTO RATING VALUES(909, 9005, 8);
INSERT INTO RATING VALUES(907, 9010, 10);
INSERT INTO RATING VALUES(925, 9018, 7);
INSERT INTO RATING VALUES(902, 9003, 8);
INSERT INTO RATING VALUES(919, 9001, 9);
INSERT INTO RATING VALUES(915, 9009, 6);
INSERT INTO RATING VALUES(920, 9008, 7);
INSERT INTO RATING VALUES(924, 9018, 7);
INSERT INTO RATING VALUES(913, 9003, 7);
INSERT INTO RATING VALUES(907, 9020, 9);
INSERT INTO RATING VALUES(910, 9015, 6);
INSERT INTO RATING VALUES(925, 9011, 3);
INSERT INTO RATING VALUES(918, 9004, 6);
INSERT INTO RATING VALUES(905, 9001, 5);
INSERT INTO RATING VALUES(919, 9007, 6);
INSERT INTO RATING VALUES(902, 9006, 7);
INSERT INTO RATING VALUES(910, 9008, 8);
INSERT INTO RATING VALUES(903, 9002, 5);
INSERT INTO RATING VALUES(904, 9015, 7);
INSERT INTO RATING VALUES(925, 9001, 7);
INSERT INTO RATING VALUES(919, 9016, 8);
INSERT INTO RATING VALUES(902, 9016, 6);
INSERT INTO RATING VALUES(922, 9013, 8);
INSERT INTO RATING VALUES(911, 9008, 10);
INSERT INTO RATING VALUES(903, 9018, 6);
INSERT INTO RATING VALUES(914, 9002, 9);
INSERT INTO RATING VALUES(933, 9001, 10);
INSERT INTO RATING VALUES(933, 9002, 9);
INSERT INTO RATING VALUES(933, 9003, 8);
INSERT INTO RATING VALUES(933, 9008, 7);
INSERT INTO RATING VALUES(933, 9005, 8);
INSERT INTO RATING VALUES(933, 9015, 7);
INSERT INTO RATING VALUES(933, 9010, 7);
INSERT INTO RATING VALUES(933, 9011, 9);
INSERT INTO RATING VALUES(933, 9012, 10);
INSERT INTO RATING VALUES(933, 9013, 9);
INSERT INTO RATING VALUES(907, 9002, 3);
INSERT INTO MTYPE VALUES(922,   1001);
INSERT INTO MTYPE VALUES(917,   1002);
INSERT INTO MTYPE VALUES(903,   1002);
INSERT INTO MTYPE VALUES(912,   1003);
INSERT INTO MTYPE VALUES(911,   1005);
INSERT INTO MTYPE VALUES(908,   1006);
INSERT INTO MTYPE VALUES(913,   1006);
INSERT INTO MTYPE VALUES(926,   1007);
INSERT INTO MTYPE VALUES(928,   1007);
INSERT INTO MTYPE VALUES(918,   1007);
INSERT INTO MTYPE VALUES(921,   1007);
INSERT INTO MTYPE VALUES(902,   1008);
INSERT INTO MTYPE VALUES(923,   1009);
INSERT INTO MTYPE VALUES(907,   1010);
INSERT INTO MTYPE VALUES(927,   1010);
INSERT INTO MTYPE VALUES(901,   1010);
INSERT INTO MTYPE VALUES(914,   1011);
INSERT INTO MTYPE VALUES(906,   1012);
INSERT INTO MTYPE VALUES(904,   1013);
INSERT INTO MTYPE VALUES(929,   1007);
INSERT INTO MTYPE VALUES(930,   1007);
INSERT INTO MTYPE VALUES(930,   1006);
INSERT INTO MTYPE VALUES(915,   1011);
INSERT INTO MTYPE VALUES(931,   1011);
INSERT INTO MTYPE VALUES(932,   1007);

COMMIT;