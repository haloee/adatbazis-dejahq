--adatok beadasa--
INSERT INTO terem (id, nev, kapacitas, tipus) VALUES (terem_seq.NEXTVAL, 'Eloadoterem 101', 100, 'Eloado');
INSERT INTO terem (id, nev, kapacitas, tipus) VALUES (terem_seq.NEXTVAL, 'Labor 202', 25, 'Labor');
INSERT INTO terem (id, kapacitas, nev, tipus) VALUES (terem_seq.NEXTVAL, 'Tanterem 303', 50, 'Tanterem');
INSERT INTO terem (id, nev, kapacitas, tipus) VALUES (terem_seq.NEXTVAL, 'Eloadoterem 104', 150, 'Eloado');
INSERT INTO terem (id, nev, kapacitas, tipus) VALUES (terem_seq.NEXTVAL, 'Labor 203', 30, 'Labor');
/
INSERT INTO esemeny_tipus (id, nev) VALUES (esemeny_tipus_seq.NEXTVAL, 'Ora');
INSERT INTO esemeny_tipus (id, nev) VALUES (esemeny_tipus_seq.NEXTVAL, 'Vizsga');
INSERT INTO esemeny_tipus (id, nev) VALUES (esemeny_tipus_seq.NEXTVAL, 'Workshop');
INSERT INTO esemeny_tipus (id, nev) VALUES (esemeny_tipus_seq.NEXTVAL, 'Szakkor');
INSERT INTO esemeny_tipus (id, nev) VALUES (esemeny_tipus_seq.NEXTVAL, 'Eloadas');
/
INSERT INTO tanar (id, nev, szak) VALUES (tanar_seq.NEXTVAL, 'Dr. Kovacs Anna', 'Matematika');
INSERT INTO tanar (id, nev, szak) VALUES (tanar_seq.NEXTVAL, 'Dr. Szabo Peter', 'Fizika');
INSERT INTO tanar (id, nev, szak) VALUES (tanar_seq.NEXTVAL, 'Dr. Toth Eva', 'Kemia');
INSERT INTO tanar (id, nev, szak) VALUES (tanar_seq.NEXTVAL, 'Dr. Nemeth Zoltan', 'Informatika');
INSERT INTO tanar (id, nev, szak) VALUES (tanar_seq.NEXTVAL, 'Dr. Kiss Judit', 'Biologia');
/
INSERT INTO kurzus (id, nev, tanar_id) VALUES (kurzus_seq.NEXTVAL, 'Analizis I.', 1);
INSERT INTO kurzus (id, nev, tanar_id) VALUES (kurzus_seq.NEXTVAL, 'Mechanika', 2);
INSERT INTO kurzus (id, nev, tanar_id) VALUES (kurzus_seq.NEXTVAL, 'Szerves kemia', 3);
INSERT INTO kurzus (id, nev, tanar_id) VALUES (kurzus_seq.NEXTVAL, 'Adatbazisok alapjai', 4);
INSERT INTO kurzus (id, nev, tanar_id) VALUES (kurzus_seq.NEXTVAL, 'Okologia', 5);
/
INSERT INTO kurzus_terem (id, kurzus_id, terem_id) VALUES (kurzus_terem_seq.NEXTVAL, 1, 1);
INSERT INTO kurzus_terem (id, kurzus_id, terem_id) VALUES (kurzus_terem_seq.NEXTVAL, 2, 2);
INSERT INTO kurzus_terem (id, kurzus_id, terem_id) VALUES (kurzus_terem_seq.NEXTVAL, 3, 3);
INSERT INTO kurzus_terem (id, kurzus_id, terem_id) VALUES (kurzus_terem_seq.NEXTVAL, 4, 4);
INSERT INTO kurzus_terem (id, kurzus_id, terem_id) VALUES (kurzus_terem_seq.NEXTVAL, 5, 5);
/
INSERT INTO foglalas (id, terem_id, datum, kezdet, veg, esemeny_nev) 
VALUES (foglalas_seq.NEXTVAL, 1, TO_DATE('2024-12-15', 'YYYY-MM-DD'), TO_DATE('09:00', 'HH24:MI'), TO_DATE('11:00', 'HH24:MI'), 'Analizis Vizsga');

INSERT INTO foglalas (id, terem_id, datum, kezdet, veg, esemeny_nev) 
VALUES (foglalas_seq.NEXTVAL, 2, TO_DATE('2024-12-16', 'YYYY-MM-DD'), TO_DATE('13:00', 'HH24:MI'), TO_DATE('15:00', 'HH24:MI'), 'Mechanika Ora');

INSERT INTO foglalas (id, terem_id, datum, kezdet, veg, esemeny_nev) 
VALUES (foglalas_seq.NEXTVAL, 3, TO_DATE('2024-12-17', 'YYYY-MM-DD'), TO_DATE('10:00', 'HH24:MI'), TO_DATE('12:00', 'HH24:MI'), 'Kemia Eloadas');
/
INSERT INTO foglalas_tanar (id, foglalas_id, tanar_id) VALUES (foglalas_tanar_seq.NEXTVAL, 1, 1);
INSERT INTO foglalas_tanar (id, foglalas_id, tanar_id) VALUES (foglalas_tanar_seq.NEXTVAL, 2, 2);
INSERT INTO foglalas_tanar (id, foglalas_id, tanar_id) VALUES (foglalas_tanar_seq.NEXTVAL, 3, 3);
/

