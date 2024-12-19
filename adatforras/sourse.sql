--adatok beadasa--
INSERT INTO terem (nev, kapacitas, tipus) VALUES ('Eloadoterem 101', 100, 'Eloado');
INSERT INTO terem (nev, kapacitas, tipus) VALUES ('Labor 202', 25, 'Labor');
INSERT INTO terem (nev, kapacitas, tipus) VALUES ('Tanterem 303', 50, 'Tanterem');
INSERT INTO terem (nev, kapacitas, tipus) VALUES ('Eloadoterem 104', 150, 'Eloado');
INSERT INTO terem (nev, kapacitas, tipus) VALUES ('Labor 203', 30, 'Labor');
/
INSERT INTO esemeny_tipus (nev) VALUES ('Ora');
INSERT INTO esemeny_tipus (nev) VALUES ('Vizsga');
INSERT INTO esemeny_tipus (nev) VALUES ('Workshop');
INSERT INTO esemeny_tipus (nev) VALUES ('Szakkor');
INSERT INTO esemeny_tipus (nev) VALUES ('Eloadas');
/

INSERT INTO tanar (nev, szak) VALUES ('Dr. Kovacs Anna', 'Matematika');
INSERT INTO tanar (nev, szak) VALUES ('Dr. Szabo Peter', 'Fizika');
INSERT INTO tanar (nev, szak) VALUES ('Dr. Toth Eva', 'Kemia');
INSERT INTO tanar (nev, szak) VALUES ('Dr. Nemeth Zoltan', 'Informatika');
INSERT INTO tanar (nev, szak) VALUES ('Dr. Kiss Judit', 'Biologia');
/
INSERT INTO kurzus (nev, tanar_id) VALUES ('Analizis I.', 1);
INSERT INTO kurzus (nev, tanar_id) VALUES ('Mechanika', 2);
INSERT INTO kurzus (nev, tanar_id) VALUES ('Szerves kemia', 3);
INSERT INTO kurzus (nev, tanar_id) VALUES ('Adatbazisok alapjai', 4);
INSERT INTO kurzus (nev, tanar_id) VALUES ('Okologia', 5);
/
INSERT INTO kurzus_terem (kurzus_id, terem_id) VALUES (1, 1);
INSERT INTO kurzus_terem (kurzus_id, terem_id) VALUES (2, 2);
INSERT INTO kurzus_terem (kurzus_id, terem_id) VALUES (3, 3);
INSERT INTO kurzus_terem (kurzus_id, terem_id) VALUES (4, 4);
INSERT INTO kurzus_terem (kurzus_id, terem_id) VALUES (5, 5);
/
INSERT INTO foglalas (terem_id, datum, kezdet, veg, esemeny_nev) 
VALUES (1, TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('09:00', 'HH24:MI'), TO_DATE('11:00', 'HH24:MI'), 'Analizis Vizsga');

INSERT INTO foglalas (terem_id, datum, kezdet, veg, esemeny_nev) 
VALUES (2, TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_DATE('13:00', 'HH24:MI'), TO_DATE('15:00', 'HH24:MI'), 'Mechanika Ora');

INSERT INTO foglalas (terem_id, datum, kezdet, veg, esemeny_nev) 
VALUES (3, TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_DATE('10:00', 'HH24:MI'), TO_DATE('12:00', 'HH24:MI'), 'Kemia Eloadas');
/
INSERT INTO foglalas_tanar (foglalas_id, tanar_id) VALUES (1, 1);
INSERT INTO foglalas_tanar (foglalas_id, tanar_id) VALUES (2, 2);
INSERT INTO foglalas_tanar (foglalas_id, tanar_id) VALUES (3, 3);
/

