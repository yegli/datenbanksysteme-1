/*
* Fremdschluessel setzen
*/
ALTER TABLE kunden_pro_standort 
ADD CONSTRAINT fk_kps_kd
 FOREIGN KEY (kunde_id) REFERENCES kunde (id)
 ON DELETE CASCADE
 ON UPDATE CASCADE
;

ALTER TABLE kunden_pro_standort 
ADD CONSTRAINT fk_kps_so
 FOREIGN KEY (standort_id) REFERENCES standorte (id)
 ON DELETE CASCADE
 ON UPDATE CASCADE
;

ALTER TABLE mitarbeiter_pro_standort 
ADD CONSTRAINT fk_mps_ma
 FOREIGN KEY (mitarbieter_id) REFERENCES mitarbeiter (id)
 ON DELETE CASCADE
 ON UPDATE CASCADE
;

ALTER TABLE mitarbeiter_pro_standort 
ADD CONSTRAINT fk_mps_so
 FOREIGN KEY (standort_id) REFERENCES standorte (id)
 ON DELETE CASCADE
 ON UPDATE CASCADE
;

ALTER TABLE abo_kaufhistorie 
ADD CONSTRAINT fk_ak_ab
 FOREIGN KEY (abo_medell_id) REFERENCES abo_modell (id)
 ON DELETE CASCADE
 ON UPDATE CASCADE
;

ALTER TABLE abo_kaufhistorie 
ADD CONSTRAINT fk_ak_kd
 FOREIGN KEY (kunde_id) REFERENCES kunde (id)
 ON DELETE CASCADE
 ON UPDATE CASCADE
;