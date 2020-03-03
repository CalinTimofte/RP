; printer does not print
(defrule PNP
(not (or (PNP Y) (PNP N)))
=>
(printout t "PNP Y/N?" crlf)
(assert (PNP (read))))

; a red light is flashing
(defrule RLF
(not (or (RLF Y) (RLF N)))
=>
(printout t "RLF Y/N?" crlf)
(assert (RLF (read))))

; printer is unrecognised
(defrule PIU
(not (or (PIU Y) (PIU N)))
=>
(printout t "PIU Y/N?" crlf)
(assert (PIU (read))))

; check the power cable
(defrule check_power
(and (PNP Y) (RLF N) (PIU Y))
=>
(printout t "Check the power cable " crlf)
)

; check the printer-computer cable
(defrule printer-computer
(and ( PNP Y) (or (RLF Y)(RLF N)) (PIU Y))
=>
(printout t "Check the printer-computer cable" crlf))

; ensure printer software is installed
(defrule printer_software
(PIU Y)
=>
(printout t "Ensure printer software is installed" crlf))

; check/replace ink
(defrule check_ink
(or(and (PNP Y) (RLF Y) (PIU Y)) (and (PNP Y) (RLF Y) (PIU N)) (and (PNP N) (RLF Y) (PIU Y)) (and (PNP N) (RLF Y) (PIU N)))
=>
(printout t "Check/Replace ink" crlf))

; check for paper jam
(defrule check_paper_jam
(or(and (PNP Y) (RLF Y) (PIU N)) (and (PNP Y) (RLF N) (PIU N)))
=>
(printout t "Check for paper jam" crlf))