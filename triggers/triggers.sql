-- Trigger for terem table
CREATE OR REPLACE TRIGGER trg_terem_id
BEFORE INSERT ON terem
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT terem_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/

-- Trigger for esemeny_tipus table
CREATE OR REPLACE TRIGGER trg_esemeny_tipus_id
BEFORE INSERT ON esemeny_tipus
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT esemeny_tipus_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/

-- Trigger for foglalas table
CREATE OR REPLACE TRIGGER trg_foglalas_id
BEFORE INSERT ON foglalas
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT foglalas_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/

-- Trigger for tanar table
CREATE OR REPLACE TRIGGER trg_tanar_id
BEFORE INSERT ON tanar
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT tanar_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/

-- Trigger for kurzus table
CREATE OR REPLACE TRIGGER trg_kurzus_id
BEFORE INSERT ON kurzus
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT kurzus_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/

-- Trigger for foglalas_tanar table
CREATE OR REPLACE TRIGGER trg_foglalas_tanar_id
BEFORE INSERT ON foglalas_tanar
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT foglalas_tanar_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/
