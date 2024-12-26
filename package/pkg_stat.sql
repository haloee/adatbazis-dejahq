CREATE OR REPLACE PACKAGE pkg_stat AS
    -- Fuggvenyek
    FUNCTION get_foglalas_stat RETURN ty_foglalas_stat_l;
    FUNCTION get_tanar_stat RETURN ty_tanar_stat_l;

    -- Eljarasok
    PROCEDURE uj_foglalas (
        p_terem_id IN NUMBER,
        p_datum IN DATE,
        p_kezdet IN DATE,
        p_veg IN DATE,
        p_esemeny_nev IN VARCHAR2
    );
END pkg_stat;
/

CREATE OR REPLACE PACKAGE BODY pkg_stat AS

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
        -- utkozesellenorzes
        SELECT COUNT(*) INTO v_count
        FROM foglalas
        WHERE terem_id = p_terem_id
          AND datum = p_datum
          AND ((p_kezdet < veg AND p_kezdet >= kezdet) OR (p_veg > kezdet AND p_veg <= veg));

        IF v_count > 0 THEN
            RAISE v_terem_foglalt;
        END IF;

        -- uj foglalas beszurasa (ID automatikusan trigger által kitöltve)
        INSERT INTO foglalas (terem_id, datum, kezdet, veg, esemeny_nev)
        VALUES (p_terem_id, p_datum, p_kezdet, p_veg, p_esemeny_nev);
    END uj_foglalas;

    -- Foglalasi statisztikak lekerdezese
    FUNCTION get_foglalas_stat RETURN ty_foglalas_stat_l IS
        v_stats ty_foglalas_stat_l;
    BEGIN
        SELECT ty_foglalas_stat(
                   t.nev, -- terem_nev
                   COUNT(DISTINCT f.esemeny_nev), -- esemeny_szam
                   COUNT(f.id) -- foglalas_szam
               )
        BULK COLLECT INTO v_stats
        FROM terem t
        LEFT JOIN foglalas f ON t.id = f.terem_id
        GROUP BY t.nev;

        RETURN v_stats;
    END get_foglalas_stat;

    -- Tanar statisztikak lekerdezese
    FUNCTION get_tanar_stat RETURN ty_tanar_stat_l IS
        v_stats ty_tanar_stat_l;
    BEGIN
        SELECT ty_tanar_stat(
                   t.nev, -- tanar_nev
                   COUNT(DISTINCT k.id), -- kurzus_szam
                   COUNT(DISTINCT f.id) -- foglalas_szam
               )
        BULK COLLECT INTO v_stats
        FROM tanar t
        LEFT JOIN kurzus k ON t.id = k.tanar_id
        LEFT JOIN foglalas_tanar ft ON t.id = ft.tanar_id
        LEFT JOIN foglalas f ON ft.foglalas_id = f.id
        GROUP BY t.nev;

        RETURN v_stats;
    END get_tanar_stat;

END pkg_stat;
/
