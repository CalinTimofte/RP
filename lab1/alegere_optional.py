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

raspunsuri = ["Da", "Nu stiu", "Nu"]
intrebari_pachet_5 = ["Iti place programarea functionala?", "Esti interesat de programarea Android?",
                      "Iti place partea matematica a informaticii?"]

def alegere_optional_pachet5():
    print("Intrebari pt alegerea optionalului din pachet5:")
    raspunsuri_utilizator = []
    intrare_user = None
    for i, j in enumerate(intrebari_pachet_5):
        print(j)
        for x, y in enumerate(raspunsuri):
            print(x, y)
        while intrare_user not in range(len(raspunsuri)):
            print("introduceti: ", end="")
            for elem in range(len(raspunsuri) - 1):
                print(str(elem) + " ", end="")
            print("sau " + str(len(raspunsuri) - 1))
            try:
                intrare_user = int(input())
            except:
                print("Input incorect")
        raspunsuri_utilizator.append(intrare_user)
        intrare_user = None
    try:
        x = raspunsuri_utilizator.index(0)
    except:
        try:
            x = raspunsuri_utilizator.index(1)
        except:
            x = 0
    print("Optionalul ales din pachetul 5 este: " + pachet5[x])

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


alegere_optional_pachet5()
print()
print("Optionalul ales din pachetul 6 este: " + alegere_optional6())
print()
print("Optionalul ales din pachetul 7 este: " + alegere_optional7())
