--create tables--
CREATE TABLE terem (
    id NUMBER PRIMARY KEY,
    nev VARCHAR2(250) NOT NULL,
    kapacitas NUMBER NOT NULL,
    tipus VARCHAR2(100) NOT NULL
);

CREATE TABLE esemeny_tipus (
    id NUMBER PRIMARY KEY,
    nev VARCHAR2(100) NOT NULL
);

CREATE TABLE foglalas (
    id NUMBER PRIMARY KEY,
    terem_id NUMBER NOT NULL,
    datum DATE NOT NULL,
    kezdet DATE NOT NULL,
    veg DATE NOT NULL,
    esemeny_nev VARCHAR2(250) NOT NULL,
    FOREIGN KEY (terem_id) REFERENCES terem(id)
);

CREATE TABLE tanar (
    id NUMBER PRIMARY KEY,
    nev VARCHAR2(200) NOT NULL,
    szak VARCHAR2(100) NOT NULL
);

CREATE TABLE kurzus (
    id NUMBER PRIMARY KEY,
    nev VARCHAR2(200) NOT NULL,
    tanar_id NUMBER NOT NULL,
    FOREIGN KEY (tanar_id) REFERENCES tanar(id)
);

CREATE TABLE kurzus_terem (
    id NUMBER PRIMARY KEY,
    kurzus_id NUMBER NOT NULL,
    terem_id NUMBER NOT NULL,
    FOREIGN KEY (kurzus_id) REFERENCES kurzus(id),
    FOREIGN KEY (terem_id) REFERENCES terem(id)
);

CREATE TABLE foglalas_tanar (
    id NUMBER PRIMARY KEY,
    foglalas_id NUMBER NOT NULL,
    tanar_id NUMBER NOT NULL,
    FOREIGN KEY (foglalas_id) REFERENCES foglalas(id),
    FOREIGN KEY (tanar_id) REFERENCES tanar(id)
);
