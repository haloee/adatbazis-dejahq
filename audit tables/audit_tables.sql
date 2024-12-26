--audit tables--

--terem audit table--
CREATE TABLE terem_audit (
    audit_id NUMBER PRIMARY KEY,
    terem_id NUMBER,
    muvelet VARCHAR2(10),
    muvelet_ideje DATE,
    felhasznalo VARCHAR2(100),
    eredeti_adat VARCHAR2(1000)
);
/
--esemeny_tipus audit table--
CREATE TABLE esemeny_tipus_audit (
    audit_id NUMBER PRIMARY KEY,
    esemeny_id NUMBER,
    muvelet VARCHAR2(10),
    muvelet_ideje DATE,
    felhasznalo VARCHAR2(100),
    eredeti_adat VARCHAR2(1000)
);
/
--tanar audit table--
CREATE TABLE tanar_audit (
    audit_id NUMBER PRIMARY KEY,
    tanar_id NUMBER,
    muvelet VARCHAR2(10),
    muvelet_ideje DATE,
    felhasznalo VARCHAR2(100),
    eredeti_adat VARCHAR2(1000)
);
/
--kurzus audit table--
CREATE TABLE kurzus_audit (
    audit_id NUMBER PRIMARY KEY,
    kurzus_id NUMBER,
    muvelet VARCHAR2(10),
    muvelet_ideje DATE,
    felhasznalo VARCHAR2(100),
    eredeti_adat VARCHAR2(1000)
);
/
--kurzus_terem audit table--
CREATE TABLE kurzus_terem_audit (
    audit_id NUMBER PRIMARY KEY,
    kapcsolat_id NUMBER,
    muvelet VARCHAR2(10),
    muvelet_ideje DATE,
    felhasznalo VARCHAR2(100),
    eredeti_adat VARCHAR2(1000)
);
/
--foglalas audit table--
CREATE TABLE foglalas_audit (
    audit_id NUMBER PRIMARY KEY,
    foglalas_id NUMBER,
    muvelet VARCHAR2(10),
    muvelet_ideje DATE,
    felhasznalo VARCHAR2(100),
    eredeti_adat VARCHAR2(1000)
);
/
--foglalas_tanar audit table--
CREATE TABLE foglalas_tanar_audit (
    audit_id NUMBER PRIMARY KEY,
    kapcsolat_id NUMBER,
    muvelet VARCHAR2(10),
    muvelet_ideje DATE,
    felhasznalo VARCHAR2(100),
    eredeti_adat VARCHAR2(1000)
);
/
