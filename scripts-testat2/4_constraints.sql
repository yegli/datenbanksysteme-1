-- Yanick Egli, Gaëtan Allemann
/*
 * Foreign Keys and Constraints
 */

-- Constraints for the vertrag table
ALTER TABLE vertrag
ADD CONSTRAINT chk_zahlungsdatum_past CHECK (zahlungsdatum <= CURRENT_DATE),                -- Ensure payment date is not in the future
ADD CONSTRAINT chk_zahlungsdatum_after_kaufdatum CHECK (verkaufsdatum <= zahlungsdatum);    -- Ensure payment date is after purchase date 

ALTER TABLE person
ADD CONSTRAINT fk_person_kunde
    FOREIGN KEY (fk_kunde) REFERENCES kunde(kunden_nummer),
ADD CONSTRAINT fk_person_mitarbeiter
    FOREIGN KEY (fk_mitarbeiter) REFERENCES mitarbeiter(mitarbeiter_nummer);

ALTER TABLE verkaeufer
ADD CONSTRAINT dk_verkaeufer_mitarbeiter
    FOREIGN KEY (fk_mitarbeiter) REFERENCES mitarbeiter(mitarbeiter_nummer),
ADD CONSTRAINT dk_verkaeufer_standort
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
