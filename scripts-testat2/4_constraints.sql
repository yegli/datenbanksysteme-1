-- Yanick Egli, Gaëtan Allemann
/*
 * Foreign Keys and Constraints
 */

-- Constraints for the vertrag table
ALTER TABLE vertrag
ADD CONSTRAINT chk_zahlungsdatum_past CHECK (zahlungsdatum <= CURRENT_DATE),                -- Ensure payment date is not in the future
ADD CONSTRAINT chk_zahlungsdatum_after_kaufdatum CHECK (verkaufsdatum <= zahlungsdatum);    -- Ensure payment date is after purchase date
