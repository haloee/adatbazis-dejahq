CREATE TYPE ty_tanar_stat AS OBJECT (
    tanar_nev VARCHAR2(250),
    kurzus_szam NUMBER,
    foglalas_szam NUMBER
);
/
CREATE TYPE ty_tanar_stat_l AS TABLE OF ty_tanar_stat;
/
CREATE OR REPLACE FUNCTION get_tanar_stat
RETURN ty_tanar_stat_l PIPELINED IS
    v_stat ty_tanar_stat;
BEGIN
    FOR rec IN (
        SELECT t.nev AS tanar_nev,
               COUNT(DISTINCT k.id) AS kurzus_szam,
               COUNT(DISTINCT f.id) AS foglalas_szam
        FROM tanar t
        LEFT JOIN kurzus k ON t.id = k.tanar_id
        LEFT JOIN foglalas_tanar ft ON t.id = ft.tanar_id
        LEFT JOIN foglalas f ON ft.foglalas_id = f.id
        GROUP BY t.nev
    ) LOOP
        v_stat := ty_tanar_stat(rec.tanar_nev, rec.kurzus_szam, rec.foglalas_szam);
        PIPE ROW(v_stat);
    END LOOP;
    RETURN;
END get_tanar_stat;
/
SELECT * FROM TABLE(get_tanar_stat());
