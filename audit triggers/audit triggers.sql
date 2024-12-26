--audit triggers--

--terem audit trigger--
CREATE OR REPLACE TRIGGER trg_terem_audit
AFTER INSERT OR UPDATE OR DELETE ON terem
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO terem_audit (
            audit_id,
            terem_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,         -- Audit ID
            :NEW.id,                  -- Új rekord ID-ja
            'INSERT',                 -- Mûvelet típusa
            SYSDATE,                  -- Mûvelet idõpontja
            USER,                     -- Mûvelet végrehajtója
            NULL                      -- Eredeti adat beszúrásnál nincs
        );

    ELSIF UPDATING THEN
        INSERT INTO terem_audit (
            audit_id,
            terem_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,         -- Audit ID
            :OLD.id,                  -- Régi rekord ID-ja
            'UPDATE',                 -- Mûvelet típusa
            SYSDATE,                  -- Mûvelet idõpontja
            USER,                     -- Mûvelet végrehajtója
            'Nev: ' || :OLD.nev || ', Kapacitas: ' || :OLD.kapacitas || ', Tipus: ' || :OLD.tipus
        );

    ELSIF DELETING THEN
        INSERT INTO terem_audit (
            audit_id,
            terem_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,         -- Audit ID
            :OLD.id,                  -- Törölt rekord ID-ja
            'DELETE',                 -- Mûvelet típusa
            SYSDATE,                  -- Mûvelet idõpontja
            USER,                     -- Mûvelet végrehajtója
            'Nev: ' || :OLD.nev || ', Kapacitas: ' || :OLD.kapacitas || ', Tipus: ' || :OLD.tipus
        );
    END IF;
END;
/


--esemeny-tipus audit trigger--
CREATE OR REPLACE TRIGGER trg_esemeny_tipus_audit
AFTER INSERT OR UPDATE OR DELETE ON esemeny_tipus
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO esemeny_tipus_audit (
            audit_id,
            esemeny_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :NEW.id,
            'INSERT',
            SYSDATE,
            USER,
            NULL
        );

    ELSIF UPDATING THEN
        INSERT INTO esemeny_tipus_audit (
            audit_id,
            esemeny_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'UPDATE',
            SYSDATE,
            USER,
            'Nev: ' || :OLD.nev
        );

    ELSIF DELETING THEN
        INSERT INTO esemeny_tipus_audit (
            audit_id,
            esemeny_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'DELETE',
            SYSDATE,
            USER,
            'Nev: ' || :OLD.nev
        );
    END IF;
END;
/

--tanar audit trigger--
CREATE OR REPLACE TRIGGER trg_tanar_audit
AFTER INSERT OR UPDATE OR DELETE ON tanar
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO tanar_audit (
            audit_id,
            tanar_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :NEW.id,
            'INSERT',
            SYSDATE,
            USER,
            NULL
        );

    ELSIF UPDATING THEN
        INSERT INTO tanar_audit (
            audit_id,
            tanar_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'UPDATE',
            SYSDATE,
            USER,
            'Nev: ' || :OLD.nev || ', Szak: ' || :OLD.szak
        );

    ELSIF DELETING THEN
        INSERT INTO tanar_audit (
            audit_id,
            tanar_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'DELETE',
            SYSDATE,
            USER,
            'Nev: ' || :OLD.nev || ', Szak: ' || :OLD.szak
        );
    END IF;
END;
/

--kurzus audit trigger--
CREATE OR REPLACE TRIGGER trg_kurzus_audit
AFTER INSERT OR UPDATE OR DELETE ON kurzus
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO kurzus_audit (
            audit_id,
            kurzus_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :NEW.id,
            'INSERT',
            SYSDATE,
            USER,
            NULL
        );

    ELSIF UPDATING THEN
        INSERT INTO kurzus_audit (
            audit_id,
            kurzus_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'UPDATE',
            SYSDATE,
            USER,
            'Nev: ' || :OLD.nev || ', Tanar_ID: ' || :OLD.tanar_id
        );

    ELSIF DELETING THEN
        INSERT INTO kurzus_audit (
            audit_id,
            kurzus_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'DELETE',
            SYSDATE,
            USER,
            'Nev: ' || :OLD.nev || ', Tanar_ID: ' || :OLD.tanar_id
        );
    END IF;
END;
/

--kurzus_terem audit trigger--
CREATE OR REPLACE TRIGGER trg_kurzus_terem_audit
AFTER INSERT OR UPDATE OR DELETE ON kurzus_terem
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO kurzus_terem_audit (
            audit_id,
            kapcsolat_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :NEW.id,
            'INSERT',
            SYSDATE,
            USER,
            NULL
        );

    ELSIF UPDATING THEN
        INSERT INTO kurzus_terem_audit (
            audit_id,
            kapcsolat_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'UPDATE',
            SYSDATE,
            USER,
            'Kurzus_ID: ' || :OLD.kurzus_id || ', Terem_ID: ' || :OLD.terem_id
        );

    ELSIF DELETING THEN
        INSERT INTO kurzus_terem_audit (
            audit_id,
            kapcsolat_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'DELETE',
            SYSDATE,
            USER,
            'Kurzus_ID: ' || :OLD.kurzus_id || ', Terem_ID: ' || :OLD.terem_id
        );
    END IF;
END;
/

--foglalas audit trigger--
CREATE OR REPLACE TRIGGER trg_foglalas_audit
AFTER INSERT OR UPDATE OR DELETE ON foglalas
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO foglalas_audit (
            audit_id,
            foglalas_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :NEW.id,
            'INSERT',
            SYSDATE,
            USER,
            NULL
        );

    ELSIF UPDATING THEN
        INSERT INTO foglalas_audit (
            audit_id,
            foglalas_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'UPDATE',
            SYSDATE,
            USER,
            'Terem_ID: ' || :OLD.terem_id || ', Datum: ' || TO_CHAR(:OLD.datum, 'YYYY-MM-DD') || ', Eloadas: ' || :OLD.esemeny_nev
        );

    ELSIF DELETING THEN
        INSERT INTO foglalas_audit (
            audit_id,
            foglalas_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'DELETE',
            SYSDATE,
            USER,
            'Terem_ID: ' || :OLD.terem_id || ', Datum: ' || TO_CHAR(:OLD.datum, 'YYYY-MM-DD') || ', Eloadas: ' || :OLD.esemeny_nev
        );
    END IF;
END;
/

--foglalas_tanar audit trigger--
CREATE OR REPLACE TRIGGER trg_foglalas_tanar_audit
AFTER INSERT OR UPDATE OR DELETE ON foglalas_tanar
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO foglalas_tanar_audit (
            audit_id,
            kapcsolat_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :NEW.id,
            'INSERT',
            SYSDATE,
            USER,
            NULL
        );

    ELSIF UPDATING THEN
        INSERT INTO foglalas_tanar_audit (
            audit_id,
            kapcsolat_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'UPDATE',
            SYSDATE,
            USER,
            'Foglalas_ID: ' || :OLD.foglalas_id || ', Tanar_ID: ' || :OLD.tanar_id
        );

    ELSIF DELETING THEN
        INSERT INTO foglalas_tanar_audit (
            audit_id,
            kapcsolat_id,
            muvelet,
            muvelet_ideje,
            felhasznalo,
            eredeti_adat
        )
        VALUES (
            audit_seq.NEXTVAL,
            :OLD.id,
            'DELETE',
            SYSDATE,
            USER,
            'Foglalas_ID: ' || :OLD.foglalas_id || ', Tanar_ID: ' || :OLD.tanar_id
        );
    END IF;
END;
/
