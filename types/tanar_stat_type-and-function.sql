CREATE TYPE ty_tanar_stat AS OBJECT (
    tanar_nev VARCHAR2(250),
    kurzus_szam NUMBER,
    foglalas_szam NUMBER
);
/
CREATE TYPE ty_tanar_stat_l AS TABLE OF ty_tanar_stat;
/

