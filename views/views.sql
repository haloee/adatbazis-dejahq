CREATE OR REPLACE VIEW tantermek_kihasznaltsaga AS
SELECT 
    t.nev AS terem_nev,
    t.tipus AS terem_tipus,
    COUNT(f.id) AS foglalasok_szama,
    MAX(f.datum) AS utolso_foglalas
FROM terem t
LEFT JOIN foglalas f ON t.id = f.terem_id
GROUP BY t.nev, t.tipus;
/
CREATE OR REPLACE VIEW tanar_kurzusai AS
SELECT 
    tanar.nev AS tanar_nev,
    kurzus.nev AS kurzus_nev,
    terem.nev AS terem_nev
FROM tanar
INNER JOIN kurzus ON tanar.id = kurzus.tanar_id
INNER JOIN kurzus_terem kt ON kurzus.id = kt.kurzus_id
INNER JOIN terem ON kt.terem_id = terem.id;
/
CREATE OR REPLACE VIEW foglalas_reszletek AS
SELECT 
    f.id AS foglalas_id,
    t.nev AS terem_nev,
    f.esemeny_nev,
    f.datum,
    f.kezdet,
    f.veg
FROM foglalas f
INNER JOIN terem t ON f.terem_id = t.id;
/
CREATE OR REPLACE VIEW kurzus_helyszinek AS
SELECT 
    kurzus.nev AS kurzus_nev,
    terem.nev AS terem_nev
FROM kurzus
INNER JOIN kurzus_terem ON kurzus.id = kurzus_terem.kurzus_id
INNER JOIN terem ON kurzus_terem.terem_id = terem.id;
/
CREATE OR REPLACE VIEW tanar_foglalasai AS
SELECT 
    tanar.nev AS tanar_nev,
    f.esemeny_nev,
    f.datum,
    f.kezdet,
    f.veg
FROM tanar
INNER JOIN foglalas_tanar ft ON tanar.id = ft.tanar_id
INNER JOIN foglalas f ON ft.foglalas_id = f.id;
/
