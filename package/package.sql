CREATE OR REPLACE PACKAGE pkg_tanterem IS
    -- Tipusok
    TYPE terem_stat_typ IS RECORD (
        terem_nev VARCHAR2(250),
        foglalasok_szama NUMBER
    );
    TYPE terem_stat_table IS TABLE OF terem_stat_typ;

    TYPE kurzus_typ IS RECORD (
        kurzus_nev VARCHAR2(250),
        terem_nev VARCHAR2(250)
    );
    TYPE kurzus_table IS TABLE OF kurzus_typ;

    TYPE tanar_foglalas_typ IS RECORD (
        esemeny_nev VARCHAR2(250),
        datum DATE,
        kezdet DATE,
        veg DATE,
        terem_nev VARCHAR2(250)
    );
    TYPE tanar_foglalas_table IS TABLE OF tanar_foglalas_typ;

    -- Eljarasok
    PROCEDURE uj_foglalas (
        p_terem_id IN NUMBER,
        p_datum IN DATE,
        p_kezdet IN DATE,
        p_veg IN DATE,
        p_esemeny_nev IN VARCHAR2
    );

    -- Fuggvenyek
    FUNCTION get_stat RETURN terem_stat_table;

    FUNCTION get_kurzusok RETURN kurzus_table;

    FUNCTION tanar_foglalasok (p_tanar_id IN NUMBER) RETURN tanar_foglalas_table;
END pkg_tanterem;
/


CREATE OR REPLACE PACKAGE BODY pkg_tanterem IS

    -- Uj foglalas letrehozasa
    PROCEDURE uj_foglalas (
        p_terem_id IN NUMBER,
        p_datum IN DATE,
        p_kezdet IN DATE,
        p_veg IN DATE,
        p_esemeny_nev IN VARCHAR2
    ) IS
        v_terem_foglalt EXCEPTION;
        v_count NUMBER;
    BEGIN
        -- Utkozesellenorzes
        SELECT COUNT(*) INTO v_count
        FROM foglalas
        WHERE terem_id = p_terem_id
          AND datum = p_datum
          AND ((p_kezdet < veg AND p_kezdet >= kezdet) OR (p_veg > kezdet AND p_veg <= veg));

        IF v_count > 0 THEN
            RAISE v_terem_foglalt;
        END IF;

        -- Uj foglalas beszurasa
        INSERT INTO foglalas (terem_id, datum, kezdet, veg, esemeny_nev)
        VALUES (p_terem_id, p_datum, p_kezdet, p_veg, p_esemeny_nev);
    END uj_foglalas;

    -- Foglalasi statisztikak lekerdezese
    FUNCTION get_stat RETURN terem_stat_table IS
        v_stats terem_stat_table;
    BEGIN
        SELECT t.nev AS terem_nev, COUNT(f.id) AS foglalasok_szama
        BULK COLLECT INTO v_stats
        FROM terem t
        LEFT JOIN foglalas f ON t.id = f.terem_id
        GROUP BY t.nev;
        RETURN v_stats;
    END get_stat;

    -- Kurzusok és hozzajuk tartozo termek
    FUNCTION get_kurzusok RETURN kurzus_table IS
        v_kurzusok kurzus_table;
    BEGIN
        SELECT k.nev AS kurzus_nev, t.nev AS terem_nev
        BULK COLLECT INTO v_kurzusok
        FROM kurzus k
        INNER JOIN kurzus_terem kt ON k.id = kt.kurzus_id
        INNER JOIN terem t ON kt.terem_id = t.id;
        RETURN v_kurzusok;
    END get_kurzusok;

    -- Tanarhoz tartozo foglalasok
    FUNCTION tanar_foglalasok (p_tanar_id IN NUMBER) RETURN tanar_foglalas_table IS
        v_foglalasok tanar_foglalas_table;
    BEGIN
        SELECT f.esemeny_nev, f.datum, f.kezdet, f.veg, t.nev AS terem_nev
        BULK COLLECT INTO v_foglalasok
        FROM foglalas f
        INNER JOIN foglalas_tanar ft ON f.id = ft.foglalas_id
        INNER JOIN terem t ON f.terem_id = t.id
        WHERE ft.tanar_id = p_tanar_id;
        RETURN v_foglalasok;
    END tanar_foglalasok;

END pkg_tanterem;
/
