CREATE INDEX OsobyIdx ON Osoby (Imie ASC, DrugieImie ASC, Nazwisko ASC);
CREATE INDEX UzytkownicyIdx ON Uzytkownicy (DaneLogowaniaidDaneLogowania ASC);
CREATE INDEX DaneLogowaniaIdx ON DaneLogowania (Login ASC);
CREATE INDEX KlasyIdx ON Klasy (NauczycieleidNauczyciel ASC);
CREATE INDEX UczniowieRodzicIdx ON Uczniowie (RodziceidRodzic ASC);
CREATE INDEX UczniowieKlasyIdx ON Uczniowie (KlasyidKlasa ASC);
CREATE INDEX LekcjeZajeciaIdx ON Lekcje (ZajeciaidZajecia ASC);
CREATE INDEX LekcjeDataAscIdx ON Lekcje (Data ASC);
CREATE INDEX LekcjeDataDescIdx ON Lekcje (Data DESC);
CREATE INDEX ObecnosciLekcjaIdx ON Obecnosci (LekcjeidLekcja DESC);
CREATE INDEX ObecnosciUczenIdx ON Obecnosci (UczniowieidUczen ASC);
CREATE INDEX OcenyUczenIdx ON Oceny (UczniowieidUczen ASC);
CREATE INDEX OcenyLekcjaIdx ON Oceny (LekcjeidLekcja ASC);
CREATE INDEX ZajeciaNauczycielIdx ON Zajecia (NauczycieleidNauczyciel ASC);
CREATE INDEX ZajeciaKlasaIdx ON Zajecia (KlasyidKlasa ASC);
CREATE INDEX SprawdzianyLekcja ON Sprawdziany (LekcjeidLekcja ASC);

