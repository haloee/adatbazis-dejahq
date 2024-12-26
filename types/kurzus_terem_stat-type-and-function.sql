CREATE TYPE ty_foglalas_stat AS OBJECT (
    terem_nev VARCHAR2(250),
    esemeny_szam NUMBER,
    foglalas_szam NUMBER
);
/
CREATE TYPE ty_foglalas_stat_l AS TABLE OF ty_foglalas_stat;
/

