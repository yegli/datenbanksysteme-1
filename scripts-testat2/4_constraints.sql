 /*
 * Foreign Keys and Constraints
 */

-- Constraints for the vertrag table
ALTER TABLE vertrag
ADD CONSTRAINT chk_zahlungsdatum_past CHECK (zahlungsdatum <= CURRENT_DATE),                -- Ensure payment date is not in the future
ADD CONSTRAINT chk_zahlungsdatum_after_kaufdatum CHECK (verkaufsdatum <= zahlungsdatum);    -- Ensure payment date is after purchase date

-- Constraints for the fahrzeug table
ALTER TABLE fahrzeug
ADD CONSTRAINT chk_preis CHECK (preis > 0),                        -- Ensure price is greater than 0
ADD CONSTRAINT chk_baujahr CHECK (baujahr <= EXTRACT(YEAR FROM CURRENT_DATE)), -- Ensure manufacturing year is not in the future
ADD CONSTRAINT chk_verfuegbarkeit CHECK (                           -- Ensure vehicle availability
    (verfuegbarkeit = TRUE)
    OR (verfuegbarkeit = FALSE)
);
