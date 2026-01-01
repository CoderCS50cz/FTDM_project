CREATE TABLE uzivateli (
  uzivatel_id INTEGER PRIMARY KEY,
  jmeno TEXT,
  email TEXT UNIQUE,
  datum_registrace DATE
);

CREATE TABLE telefony (
  telefon_id INTEGER PRIMARY KEY,
  znacka TEXT,
  model TEXT,
  zakladni_cena REAL
);

CREATE TABLE zaruky (
  zaruka_id INTEGER PRIMARY KEY,
  delka_mesicu INTEGER,
  cena REAL,
  telefon_id INTEGER,
  FOREIGN KEY (telefon_id) REFERENCES telefony(telefon_id)
);

CREATE TABLE objednavky (
  objednavka_id INTEGER PRIMARY KEY,
  datum_objednavky DATE,
  status TEXT,
  uzivatel_id INTEGER,
  FOREIGN KEY (uzivatel_id) REFERENCES uzivateli(uzivatel_id)
);

CREATE TABLE polozky_objednavek (
  objednavka_id INTEGER,
  telefon_id INTEGER,
  zaruka_id INTEGER,
  mnozstvi INTEGER,
  FOREIGN KEY (objednavka_id) REFERENCES objednavky(objednavka_id),
  FOREIGN KEY (telefon_id) REFERENCES telefony(telefon_id),
  FOREIGN KEY (zaruka_id) REFERENCES zaruky(zaruka_id)
);
