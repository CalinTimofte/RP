; Fapte meniu
(deffacts a (meniu))

; Template student
(deftemplate student
        (slot nume)
        (multislot teme)
        (slot proiect)
        (slot examen)
        (slot punctaj)
        (slot check)
)

; Meniu
(defrule afis_main
?a <- (meniu)
=>
(printout t "
			1. Adauga student. 
			2. Afisare informatii student.
			3. Adauga punctaj laborator. (se indica tema 1-7 corespunzatoare si punctajul, se verifica daca exista deja, caz in care este ceruta confirmarea suprascrierii)
			4. Adauga punctaj proiect.
			5. Adauga punctaj examen.
			6. Afisare studenti restantieri. (punctaj sub 50)
			7. Afisare studenti in ordine descrescatoare a punctajelor."
)
(assert (optiune (read)))
(retract ?a)
)

; 1. Adauga student
(defrule adauga_student
?id <- (optiune 1)
=>
(printout t "Dati numele studentului: " crlf)
(assert (student (nume (read))(teme 1 0 2 0 3 0 4 0 5 0 6 0 7 0)(proiect 0)(examen 0)(punctaj 0)(check 0)))
(assert (meniu))
(retract ?id)
)

; Selectare student
(defrule cautare_nume
?id <- (optiune 2)
=>
(printout t "Introduceti numele studentului: " crlf)
(assert (cautare_nume (read)))
(retract ?id)
)

; 2. Informatii student
(defrule afiseaza_informatii_student
?id <- (cautare_nume ?x)
(student (nume ?x) (teme $?teme) (proiect ?proiect) (examen ?examen) (punctaj ?punctaj) (check ?check))
=>
(printout t "Nume: " ?x crlf)
(printout t "Teme: " ?teme crlf)
(printout t "Proiect: " ?proiect crlf)
(printout t "Examen: " ?examen crlf)
(printout t "Punctaj: " ?punctaj crlf)
(assert (meniu))
(retract ?id)
)

; 3.0 Functie ajutatoare
(defrule optiune3
?id <- (optiune 3)
=>
(printout t "Introduceti numele studentului, numarul temei si punctajul (nume nr punctaj): " crlf)
(assert (optiune3 (explode$ (readline) ) ) )
(retract ?id)
)

; 3.1 Adaugare teme
(defrule optiune3_functionality
?id <- (optiune3 ?nume ?tema ?punctaj)
?student_fact <- (student (nume ?nume) (teme $?teme_inainte ?tema ?x $?teme_dupa))
=>
(modify ?student_fact (teme $?teme_inainte ?tema ?punctaj $?teme_dupa))
(retract ?id)
(assert (meniu))
)


; 4.0 Functie ajutatoare 
(defrule adaugare_proiect
?id <- (optiune 4)
=>
(printout t "Introduceti numele studentului si nota la proiect " crlf)
(assert (adaugare_proiect (explode$ (readline)))
(retract ?id)
))

; 4.1 Adauga punctaj proiect
(defrule adauga_punctaj_proiect
?id <- (adaugare_proiect ?nume ?proiect)
?proiecte <- (student (nume ?name)(proiect ?x))
=>
(printout t "Dati punctajul studentului la proiect: " crlf)
(modify ?proiecte (proiect ?proiect))
(assert (meniu))
(retract ?id)
)

; 5.0 Functie ajutatoare 
(defrule adauga_examen
?id <- (optiune 5)
=>
(printout t "Introduceti numele studentului si nota la examen " crlf)
(assert (adauga_examen (explode$ (readline)))
(retract ?id)
))

; 5.1 Adauga punctaj examen
(defrule adauga_punctaj_examen
?id <- (adauga_examen ?nume ?examen)
?examene <- (student (nume ?name)(examen ?x))
=>
(printout t "Dati punctajul studentului la examen: " crlf)
(modify ?examene (examen ?examen))
(assert (meniu))
(retract ?id)
)