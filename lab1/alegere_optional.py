pachet5 = ["Programare bazata pe reguli", "Tehnici de programare pe platforma Android",
           "Aspecte computationale in teoria numerelor"]
pachet6 = ["Psihologia comunicării profesionale în domeniul IT-lui", "Cloud Computing",
           "Tehnici de ingineria limbajului natural", "Analiza reţelelor media sociale"]
pachet7 = ["Reţele Petri şi aplicaţii", "Smart Card-uri şi Aplicaţii", "Topici speciale de programare .NET"]

raspunsuri_pachet6 = [0, 0, 0, 0]
raspunsuri_pachet7 = [0, 0, 0]

intrebari_pachet_6 = ["Esti o persoana care are un interest pentru psihologie?",
                      "Iti plac aplicatiile WEB?",
                      "Te-a interesat Inteligenta Artificiala?",
                      "Iti place sa urmaresti trendurile si vrei sa stii ce se ascunde in spatele retelelor media?"]

intrebari_pachet_7 = ["Este interesat de Retele Petri?",
                      "Vrei sa stii cum functioneaza cardul pe care iti tii banii?",
                      "Vrei sa inveti .NET?"]


def alegere_optional6():
    print("Alegere optional pachet 6")
    print("Variante de raspuns: 0 - Da; 1 - Nu; 2 - Nu stiu")
    for intrebare in intrebari_pachet_6:
        print(intrebare)
        raspuns = int(input())
        if raspuns == 0:
            raspunsuri_pachet6[intrebari_pachet_6.index(intrebare)] += 2
        if raspuns == 2:
            raspunsuri_pachet6[intrebari_pachet_6.index(intrebare)] += 1
    return pachet6[raspunsuri_pachet6.index(max(raspunsuri_pachet6))]


def alegere_optional7():
    print("Alegere optional pachet 7")
    print("Variante de raspuns: 0 - Da; 1 - Nu; 2 - Nu stiu")
    for intrebare in intrebari_pachet_7:
        print(intrebare)
        raspuns = int(input())
        if raspuns == 0:
            raspunsuri_pachet7[intrebari_pachet_7.index(intrebare)] += 2
        if raspuns == 2:
            raspunsuri_pachet7[intrebari_pachet_7.index(intrebare)] += 1
    return pachet7[raspunsuri_pachet7.index(max(raspunsuri_pachet7))]


print(alegere_optional6())
