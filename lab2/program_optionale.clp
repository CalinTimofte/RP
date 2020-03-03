(defrule PF
(not (or(PF Y) (PF N) (PF IDK)))
=>
(printout t "Do you like functional programming? Y/N/IDK" crlf)
(assert (PF (read)))
)

(defrule AP
(not (or(AP Y) (AP N) (AP IDK)))
=>
(printout t "Are you interested in Android programming? Y/N/IDK" crlf)
(assert (AP (read)))
)

(defrule MATH
(not (or(MATH Y) (MATH N) (MATH IDK)))
=>
(printout t "Do you like the math part of computer science? Y/N/IDK" crlf)
(assert (MATH (read)))
)

(assert (OPT1 UNSET))

(defrule 