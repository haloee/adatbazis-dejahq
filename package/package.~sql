CREATE OR REPLACE PACKAGE pkg_tanterem IS
    -- Eljárások
    PROCEDURE uj_foglalas (
        terem_id IN NUMBER,
        datum IN DATE,
        kezdet IN DATE,
        veg IN DATE,
        esemeny_nev IN VARCHAR2
    );

    -- Függvények
    FUNCTION get_stat RETURN SYS_REFCURSOR;

    FUNCTION get_kurzusok RETURN SYS_REFCURSOR;

    FUNCTION tanar_foglalasok (tanar_id IN NUMBER) RETURN SYS_REFCURSOR;
END pkg_tanterem;
/
CREATE OR REPLACE PACKAGE BODY pkg_tanterem IS

    -- Új foglalás létrehozása
    PROCEDURE uj_foglalas (
        terem_id IN NUMBER,
        datum IN DATE,
        kezdet IN DATE,
        veg IN DATE,
        esemeny_nev IN VARCHAR2
    ) IS
        v_terem_foglalt EXCEPTION;
        v_count NUMBER;
    BEGIN
        -- Ütközésellenõrzés
        SELECT COUNT(*) INTO v_count
        FROM foglalas
        WHERE terem_id = terem_id
          AND datum = datum
          AND ((kezdet < veg AND kezdet >= kezdet) OR (veg > kezdet AND veg <= veg));

        IF v_count > 0 THEN
            RAISE v_terem_foglalt;
        END IF;

        -- Új foglalás beszúrása
        INSERT INTO foglalas (id, terem_id, datum, kezdet, veg, esemeny_nev)
        VALUES (foglalas_seq.NEXTVAL, terem_id, datum, kezdet, veg, esemeny_nev);
    END uj_foglalas;

    -- Foglalási statisztikák lekérdezése
    FUNCTION get_stat RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
        SELECT t.nev AS terem_nev, COUNT(f.id) AS foglalasok_szama
        FROM terem t
        LEFT JOIN foglalas f ON t.id = f.terem_id
        GROUP BY t.nev;
        RETURN v_cursor;
    END get_stat;

    -- Kurzusok és hozzájuk tartozó termek
    FUNCTION get_kurzusok RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
        SELECT k.nev AS kurzus_nev, t.nev AS terem_nev
        FROM kurzus k
        INNER JOIN kurzus_terem kt ON k.id = kt.kurzus_id
        INNER JOIN terem t ON kt.terem_id = t.id;
        RETURN v_cursor;
    END get_kurzusok;

    -- Tanárhoz tartozó foglalások
    FUNCTION tanar_foglalasok (tanar_id IN NUMBER) RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
        SELECT f.esemeny_nev, f.datum, f.kezdet, f.veg, t.nev AS terem_nev
        FROM foglalas f
        INNER JOIN foglalas_tanar ft ON f.id = ft.foglalas_id
        INNER JOIN terem t ON f.terem_id = t.id
        WHERE ft.tanar_id = tanar_id;
        RETURN v_cursor;
    END tanar_foglalasok;

END pkg_tanterem;
/
