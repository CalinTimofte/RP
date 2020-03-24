; Timofte Calin, Platica Alexandru-Gabriel

(deftemplate propozitie
(multislot name)
)

; Citirea propozitiei
(defrule read_propozitie
(not (propozitie (name ?) ))
=>
(printout t "Give a phrase" crlf)
(assert (propozitie (name (explode$ (readline)))))
)

; Citire primul cuvant
(defrule primul_cuvant
?word <- (propozitie (name ?name $?names))
(not (S ?))
=>
(assert (S ?name))
(modify ?word (name $?names) )
)

; Citire dupa cuvantul "Am"
(defrule G1
?word <- (S Am)
?restul <- (propozitie (name ?name $?names))
(not (A ?))
=>
(assert(A ?name))
(modify ?restul (name $?names))
)

; Citire dupa cuvantul "citit"
(defrule G2
?word <- (A citit)
?restul <- (propozitie (name ?name $?names))
(not (B ?))
=>
(assert(B ?name))
(modify ?restul (name $?names))
)

; Citire dupa cuvantul "o"
(defrule G3
?word <- (B o)
?restul <- (propozitie (name ?name $?names))
(not (C ?))
(not (A facultate))
=>
(assert(C ?name))
(modify ?restul (name end))
)

; Citire dupa cuvantul "mers"
(defrule G2'
?word <- (A mers)
?restul <- (propozitie (name ?name $?names))
(not (B ?))
=>
(assert(B ?name))
(modify ?restul (name $?names))
)

; Citire dupa cuvantul "la"
(defrule G3'
?word <- (B la)
?restul <- (propozitie (name ?name $?names))
(not (C ?))
=>
(assert(C ?name))
(modify ?restul (name end))
)

; Citire dupa cuvantul "La"
(defrule G1''
?word <- (S La)
?restul <- (propozitie (name ?name $?names))
(not (A ?))
=>
(assert(A ?name))
(modify ?restul (name $?names))
)

; Citire dupa cuvantul "facultate"
(defrule G2''
?word <- (A facultate)
?restul <- (propozitie (name ?name $?names))
(not (B ?))
=>
(assert(B ?name))
(modify ?restul (name $?names))
)

; Citire dupa cuvantul "o"
(defrule G3''
?word <- (B o)
?restul <- (propozitie (name ?name $?names))
(A facultate)
(not (C ?))
=>
(assert(C ?name))
(modify ?restul (name $?names))
)

; Citire dupa cuvantul "carte"
(defrule G4''
?word <- (C carte)
?restul <- (propozitie (name ?name $?names))
(not (D ?))
=>
(assert(D ?name))
(modify ?restul (name $?names))
)

; Citire dupa cuvantul "am"
(defrule G5''
?word <- (D am)
?restul <- (propozitie (name ?name $?names))
(not (E ?))
=>
(assert(E ?name))
(modify ?restul (name end))
)

; Afisare caz 1
(defrule afisare
(S Am)
(A citit)
(B o)
(C carte.)
=>
(assert (accepted))
(printout t "Da S G1 G2 G3" crlf)
)

; Afisare caz 2
(defrule afisare2
(S Am)
(A mers)
(B la)
(C facultate.)
=>
(assert (accepted))
(printout t "Da S G1 G2' G3'" crlf)
)

; Afisare caz 3
(defrule afisare23
(S La)
(A facultate)
(B o)
(C carte)
(D am)
(E citit.)
=>
(assert (accepted))
(printout t "Da S G1'' G2'' G3'' G4'' G5''" crlf)
)

; Propozitia nu este acceptata
(defrule respingere
(not (accepted))
=>
(printout t "Nu" crlf)
)