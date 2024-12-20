-- Yanick Egli, Gaëtan Allemann
/*
 * Foreign Keys
 */

-- Foreign Keys for all tables

ALTER TABLE verkaeufer
ADD CONSTRAINT fk_verkaeufer_mitarbeiter
    FOREIGN KEY (id) REFERENCES mitarbeiter(mitarbeiter_nummer),
ADD CONSTRAINT fk_verkaeufer_standort
    FOREIGN KEY (fk_standort) REFERENCES standort(id);

ALTER TABLE fahrzeug
ADD CONSTRAINT fk_fahrzeug_standort
    FOREIGN KEY (fk_standort) REFERENCES standort(id);

ALTER TABLE vertrag
ADD CONSTRAINT fk_vertrag_fahrzeug
    FOREIGN KEY (fk_fahrzeug) REFERENCES fahrzeug(fahrgestell_nummer),
ADD CONSTRAINT fk_vertrag_kunde
    FOREIGN KEY (fk_kunde) REFERENCES kunde(kunden_nummer);

ALTER TABLE kunde_fahrzeug
ADD CONSTRAINT fk_kunde_fahrzeug_kunde
    FOREIGN KEY (fk_kunde) REFERENCES kunde(kunden_nummer),
ADD CONSTRAINT fk_kunde_fahrzeug_fahrzeug
    FOREIGN KEY (fk_fahrzeug) REFERENCES fahrzeug(fahrgestell_nummer);

ALTER TABLE mitarbeiter
ADD CONSTRAINT fk_mitarbeiter_person
    FOREIGN KEY (mitarbeiter_nummer, type) REFERENCES person(id, type);

ALTER TABLE kunde
ADD CONSTRAINT fk_kunde_person
    FOREIGN KEY (kunden_nummer, type) REFERENCES person(id, type);

/*
 * Constraints
 */

ALTER TABLE fahrzeug
ADD CONSTRAINT chk_price_positive CHECK (preis > 0),
ADD CONSTRAINT chk_baujahr_past CHECK (baujahr <= date_part('year', CURRENT_DATE));

 -- Check that zahlungsdatum is in the past and that verkaufsdatum is before zahlungsdatum
ALTER TABLE vertrag
ADD CONSTRAINT chk_zahlungsdatum_past CHECK (zahlungsdatum <= CURRENT_DATE),                
ADD CONSTRAINT chk_zahlungsdatum_after_kaufdatum CHECK (verkaufsdatum <= zahlungsdatum);

 -- Check that a "mitarbeiter" cant be a "kunde" (scuffed version)
 ALTER TABLE kunde
 ADD CONSTRAINT chk_kunde_type_1 CHECK (type = 1);

 ALTER TABLE mitarbeiter
 ADD CONSTRAINT chk_mitarbeiter_type_0 CHECK (type = 0);