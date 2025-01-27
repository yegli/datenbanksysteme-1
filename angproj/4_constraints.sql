ALTER TABLE angestellter
    ADD CONSTRAINT fk_ang_ang
    FOREIGN KEY (chef) REFERENCES angestellter (persnr)
;

ALTER TABLE abteilungsleitung
ADD CONSTRAINT fk_abtl_abt 
    FOREIGN KEY (abtnr) REFERENCES abteilung (abtnr)
;

ALTER TABLE abteilungsleitung
ADD CONSTRAINT fk_abtchef_chef
    FOREIGN KEY (abtchef) REFERENCES angestellter (persnr)
;

ALTER TABLE projektzuteilung
ADD CONSTRAINT fk_persnr_persnr
    FOREIGN KEY (persnr) REFERENCES angestellter (persnr)
;

ALTER TABLE projektzuteilung
ADD CONSTRAINT fk_projnr_projnr
    FOREIGN KEY (projnr) REFERENCES projekt (projnr)
;

ALTER TABLE projekt
ADD CONSTRAINT fk_projleiter_persnr
    FOREIGN KEY (projleiter) REFERENCES angestellter(persnr)
;

ALTER TABLE angestellter 
ADD CONSTRAINT fk_ang_abt 
    FOREIGN KEY (abtnr) REFERENCES abteilung (abtnr)
;