CREATE TYPE ty_foglalas_stat AS OBJECT (
    terem_nev VARCHAR2(250),
    esemeny_szam NUMBER,
    foglalas_szam NUMBER
);
/
CREATE TYPE ty_foglalas_stat_l AS TABLE OF ty_foglalas_stat;
/
CREATE OR REPLACE FUNCTION get_foglalas_stat
RETURN ty_foglalas_stat_l PIPELINED IS
    v_stat ty_foglalas_stat;
BEGIN
    FOR rec IN (
        SELECT t.nev AS terem_nev,
               COUNT(DISTINCT f.esemeny_nev) AS esemeny_szam,
               COUNT(f.id) AS foglalas_szam
        FROM terem t
        LEFT JOIN foglalas f ON t.id = f.terem_id
        GROUP BY t.nev
    ) LOOP
        v_stat := ty_foglalas_stat(rec.terem_nev, rec.esemeny_szam, rec.foglalas_szam);
        PIPE ROW(v_stat);
    END LOOP;
    RETURN;
END get_foglalas_stat;
/
SELECT * FROM TABLE(get_foglalas_stat());
