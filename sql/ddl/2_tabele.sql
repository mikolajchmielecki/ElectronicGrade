CREATE TABLE Uzytkownicy (idUzytkownik int(10) NOT NULL AUTO_INCREMENT, Email varchar(63) NOT NULL UNIQUE, Zarchiwizowany bit(1) DEFAULT 0 NOT NULL, DaneLogowaniaidDaneLogowania int(10), OsobyidOsoba int(10) NOT NULL, PRIMARY KEY (idUzytkownik)) CHARACTER SET UTF8;
CREATE TABLE Uczniowie (idUzytkownik int(10) NOT NULL, KlasyidKlasa int(10), RodziceidRodzic int(10), PRIMARY KEY (idUzytkownik)) CHARACTER SET UTF8;
CREATE TABLE Rodzice (idUzytkownik int(10) NOT NULL, PRIMARY KEY (idUzytkownik)) CHARACTER SET UTF8;
CREATE TABLE Nauczyciele (idUzytkownik int(10) NOT NULL, TytulNaukowy varchar(31) NOT NULL, PRIMARY KEY (idUzytkownik)) CHARACTER SET UTF8;
CREATE TABLE Obecnosci (idObecnosc int(10) NOT NULL AUTO_INCREMENT, UczniowieidUczen int(10) NOT NULL, LekcjeidLekcja int(10) NOT NULL, Rodzaj char(1) NOT NULL, RodziceidRodzic int(10), NauczycieleidNauczyciel int(10), PRIMARY KEY (idObecnosc), CHECK (Rodzaj IN ('N', 'Z', 'U')), tempUczen int, tempLekcja int) CHARACTER SET UTF8;
CREATE TABLE Klasy (idKlasa int(10) NOT NULL AUTO_INCREMENT, NauczycieleidNauczyciel int(10) NOT NULL, Rok int(1) NOT NULL, Symbol char(1) NOT NULL, Rocznik int(4) NOT NULL, Zarchiwizowana bit(1) DEFAULT 0 NOT NULL, PRIMARY KEY (idKlasa), INDEX (NauczycieleidNauczyciel), CHECK (Rok > 0 AND Rok < 5)) CHARACTER SET UTF8;
CREATE TABLE Lekcje (idLekcja int(10) NOT NULL AUTO_INCREMENT, Data date NOT NULL, ZajeciaidZajecia int(10) NOT NULL, Temat varchar(255) NOT NULL, PRIMARY KEY (idLekcja)) CHARACTER SET UTF8;
CREATE TABLE Sprawdziany (idSprawdzian int(10) NOT NULL AUTO_INCREMENT, LekcjeidLekcja int(10) NOT NULL, Komentarz varchar(255), PRIMARY KEY (idSprawdzian)) CHARACTER SET UTF8;
CREATE TABLE Zajecia (idZajecia int(10) NOT NULL AUTO_INCREMENT, KlasyidKlasa int(10) NOT NULL, NauczycieleidNauczyciel int(10) NOT NULL, DzienTygodnia int(1) NOT NULL, Godzina time(6) NOT NULL, PrzedmiotyidPrzedmiot int(10) NOT NULL, Zarchiwizowane bit(1) DEFAULT 0 NOT NULL, PRIMARY KEY (idZajecia)) CHARACTER SET UTF8;
CREATE TABLE Przedmioty (idPrzedmiot int(10) NOT NULL AUTO_INCREMENT, Nazwa varchar(31) NOT NULL UNIQUE, PRIMARY KEY (idPrzedmiot)) CHARACTER SET UTF8;
CREATE TABLE Administratorzy (idUzytkownik int(10) NOT NULL , PRIMARY KEY (idUzytkownik)) CHARACTER SET UTF8;
CREATE TABLE Oceny (idOcena int(10) NOT NULL AUTO_INCREMENT, UczniowieidUczen int(10) NOT NULL, LekcjeidLekcja int(10) NOT NULL, Wartosc double NOT NULL, Waga double NOT NULL, Komentarz varchar(255), SprawdzianyidSprawdzian int(10), PRIMARY KEY (idOcena), CHECK (Wartosc >= 1 AND Wartosc <= 6)) CHARACTER SET UTF8;
CREATE TABLE Adresy (idAdres int(10) NOT NULL AUTO_INCREMENT, Ulica varchar(50), NumerDomu varchar(6) NOT NULL, NumerMieszkania varchar(5), Miejscowosc varchar(50) NOT NULL, KodPocztowy char(6) NOT NULL, PRIMARY KEY (idAdres)) CHARACTER SET UTF8;
CREATE TABLE Specjalnosci (idSpecjalnosc int(10) NOT NULL AUTO_INCREMENT, PrzedmiotyidPrzedmiot int(10) NOT NULL, NauczycieleidNauczyciel int(10) NOT NULL, PRIMARY KEY (idSpecjalnosc)) CHARACTER SET UTF8;
CREATE TABLE Rozszerzenia (idRozszerzenie int(10) NOT NULL AUTO_INCREMENT, KlasyidKlasa int(10) NOT NULL, PrzedmiotyidPrzedmiot int(10) NOT NULL, PRIMARY KEY (idRozszerzenie)) CHARACTER SET UTF8;
CREATE TABLE DaneLogowania (idDaneLogowania int(10) NOT NULL AUTO_INCREMENT, Login varchar(63) NOT NULL UNIQUE, Haslo char(64) NOT NULL, PRIMARY KEY (idDaneLogowania)) CHARACTER SET UTF8;
CREATE TABLE Osoby (idOsoba int(10) NOT NULL AUTO_INCREMENT, Imie varchar(31) NOT NULL, DrugieImie varchar(31), Nazwisko varchar(63) NOT NULL, PESEL bigint NOT NULL UNIQUE, DataUrodzenia date NOT NULL, Plec char(1) NOT NULL, AdresyidAdres int(10) NOT NULL, PRIMARY KEY (idOsoba), CHECK (Plec IN ('K','M') AND Pesel > 9999999999 AND Pesel < 100000000000)) CHARACTER SET UTF8;


ALTER TABLE Uczniowie ADD CONSTRAINT Ma FOREIGN KEY (RodziceidRodzic) REFERENCES Rodzice (idUzytkownik);
ALTER TABLE Uczniowie ADD CONSTRAINT NalezyDo FOREIGN KEY (KlasyidKlasa) REFERENCES Klasy (idKlasa);
ALTER TABLE Zajecia ADD CONSTRAINT PrzypisaneZajecia FOREIGN KEY (PrzedmiotyidPrzedmiot) REFERENCES Przedmioty (idPrzedmiot);
ALTER TABLE Zajecia ADD CONSTRAINT MaZajecia FOREIGN KEY (KlasyidKlasa) REFERENCES Klasy (idKlasa);
ALTER TABLE Zajecia ADD CONSTRAINT Prowadzi FOREIGN KEY (NauczycieleidNauczyciel) REFERENCES Nauczyciele (idUzytkownik);
ALTER TABLE Obecnosci ADD CONSTRAINT PrzypisywaneObecnosci FOREIGN KEY (LekcjeidLekcja) REFERENCES Lekcje (idLekcja);
ALTER TABLE Lekcje ADD CONSTRAINT SaRealizowane FOREIGN KEY (ZajeciaidZajecia) REFERENCES Zajecia (idZajecia);
ALTER TABLE Obecnosci ADD CONSTRAINT MaObecnosc FOREIGN KEY (UczniowieidUczen) REFERENCES Uczniowie (idUzytkownik);
ALTER TABLE Oceny ADD CONSTRAINT Otrzymuje FOREIGN KEY (UczniowieidUczen) REFERENCES Uczniowie (idUzytkownik);
ALTER TABLE Specjalnosci ADD CONSTRAINT PrzypisanaSpecjalnosc FOREIGN KEY (PrzedmiotyidPrzedmiot) REFERENCES Przedmioty (idPrzedmiot);
ALTER TABLE Specjalnosci ADD CONSTRAINT MaSpecjalnosc FOREIGN KEY (NauczycieleidNauczyciel) REFERENCES Nauczyciele (idUzytkownik);
ALTER TABLE Obecnosci ADD CONSTRAINT UsprawiedliwiaRodzic FOREIGN KEY (RodziceidRodzic) REFERENCES Rodzice (idUzytkownik);
ALTER TABLE Obecnosci ADD CONSTRAINT UsprawiedliwaNauczyciel FOREIGN KEY (NauczycieleidNauczyciel) REFERENCES Nauczyciele (idUzytkownik);
ALTER TABLE Sprawdziany ADD CONSTRAINT OdbywajaSie FOREIGN KEY (LekcjeidLekcja) REFERENCES Lekcje (idLekcja);
ALTER TABLE Oceny ADD CONSTRAINT SaWpisane FOREIGN KEY (LekcjeidLekcja) REFERENCES Lekcje (idLekcja);
ALTER TABLE Rodzice ADD CONSTRAINT JestRodzicem FOREIGN KEY (idUzytkownik) REFERENCES Uzytkownicy (idUzytkownik);
ALTER TABLE Administratorzy ADD CONSTRAINT JestAdministratorem FOREIGN KEY (idUzytkownik) REFERENCES Uzytkownicy (idUzytkownik);
ALTER TABLE Nauczyciele ADD CONSTRAINT JestNauczycielem FOREIGN KEY (idUzytkownik) REFERENCES Uzytkownicy (idUzytkownik);
ALTER TABLE Uczniowie ADD CONSTRAINT JestUczniem FOREIGN KEY (idUzytkownik) REFERENCES Uzytkownicy (idUzytkownik);
ALTER TABLE Oceny ADD CONSTRAINT Oceniane FOREIGN KEY (SprawdzianyidSprawdzian) REFERENCES Sprawdziany (idSprawdzian);
ALTER TABLE Rozszerzenia ADD CONSTRAINT PrzypisaneRozszerzenia FOREIGN KEY (KlasyidKlasa) REFERENCES Klasy (idKlasa);
ALTER TABLE Rozszerzenia ADD CONSTRAINT PrzypisaneRozrzeszenia FOREIGN KEY (PrzedmiotyidPrzedmiot) REFERENCES Przedmioty (idPrzedmiot);
ALTER TABLE Uzytkownicy ADD CONSTRAINT PosiadaDaneLogowania FOREIGN KEY (DaneLogowaniaidDaneLogowania) REFERENCES DaneLogowania (idDaneLogowania);
ALTER TABLE Uzytkownicy ADD CONSTRAINT JestOsoba FOREIGN KEY (OsobyidOsoba) REFERENCES Osoby (idOsoba);
ALTER TABLE Osoby ADD CONSTRAINT PosiadaAdres FOREIGN KEY (AdresyidAdres) REFERENCES Adresy (idAdres);
ALTER TABLE Klasy ADD CONSTRAINT JestWychowawca FOREIGN KEY (NauczycieleidNauczyciel) REFERENCES Nauczyciele (idUzytkownik);