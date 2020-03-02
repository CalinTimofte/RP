pachet5 = ["Programare bazata pe reguli", "Tehnici de programare pe platforma Android",
           "Aspecte computationale in teoria numerelor"]
pachet6 = ["Psihologia comunicării profesionale în domeniul IT-lui", "Cloud Computing",
           "Tehnici de ingineria limbajului natural", "Analiza reţelelor media sociale"]
pachet7 = ["Reţele Petri şi aplicaţii", "Smart Card-uri şi Aplicaţii", "Topici speciale de programare .NET"]


def alegere_optional_din_pachet(pachet):
    intrare_user = None
    for i, j in enumerate(pachet):
        print(i, j)
    while intrare_user not in range(len(pachet)):
        print("Introduceti: ", end="")
        for elem in range(len(pachet) - 1):
            print(str(elem) + " ", end="")
        print("sau " + str(len(pachet)-1))
        try:
            intrare_user = int(input())
        except:
            print("Input incorect")
    return intrare_user


def alegere_optional():
    opt1 = None
    opt2 = None
    opt3 = None

    print("Alegeti o optiune din pachetul 5: ")
    opt1 = pachet5[alegere_optional_din_pachet(pachet5)]

    print("Alegeti o optiune din pachetul 6: ")
    opt2 = pachet6[alegere_optional_din_pachet(pachet6)]

    print("Alegeti o optiune din pachetul 7: ")
    opt3 = pachet7[alegere_optional_din_pachet(pachet7)]

    print("Cursurile dumneavoastra sunt:")
    print(opt1)
    print(opt2)
    print(opt3)


alegere_optional()
