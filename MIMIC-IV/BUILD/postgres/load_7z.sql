-----------------------------------------
-- Load data into the mimiciv-IV schemas --
-----------------------------------------

-- To run from a terminal:
--  psql "dbname=<DBNAME> user=<USER>" -v mimiciv_data_dir=<PATH TO DATA DIR> -f load_gz.sql

-- core schema
\cd :mimiciv_data_dir/core

-- making sure that all tables are emtpy and correct encoding is defined -utf8- 
SET CLIENT_ENCODING TO 'utf8';

DELETE FROM mimiciv_core.admissions; 
DELETE FROM mimiciv_core.patients; 
DELETE FROM mimiciv_core.transfers;
DELETE FROM mimiciv_hosp.d_hcpcs;
DELETE FROM mimiciv_hosp.diagnoses_icd;
DELETE FROM mimiciv_hosp.d_icd_diagnoses;
DELETE FROM mimiciv_hosp.d_icd_procedures;
DELETE FROM mimiciv_hosp.d_labitems; 
DELETE FROM mimiciv_hosp.drgcodes;
DELETE FROM mimiciv_hosp.emar_detail;
DELETE FROM mimiciv_hosp.emar;
DELETE FROM mimiciv_hosp.hcpcsevents;
DELETE FROM mimiciv_hosp.labevents;
DELETE FROM mimiciv_hosp.microbiologyevents;
DELETE FROM mimiciv_hosp.pharmacy;
DELETE FROM mimiciv_hosp.poe_detail; 
DELETE FROM mimiciv_hosp.poe;
DELETE FROM mimiciv_hosp.prescriptions;
DELETE FROM mimiciv_hosp.procedures_icd;
DELETE FROM mimiciv_hosp.services;
DELETE FROM mimiciv_icu.chartevents;
DELETE FROM mimiciv_icu.datetimeevents;
DELETE FROM mimiciv_icu.d_items;
DELETE FROM mimiciv_icu.icustays;
DELETE FROM mimiciv_icu.inputevents;
DELETE FROM mimiciv_icu.outputevents;
DELETE FROM mimiciv_icu.procedureevents;


\COPY mimiciv_core.admissions FROM PROGRAM '7z e -so admissions.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_core.patients FROM PROGRAM '7z e -so patients.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_core.transfers FROM PROGRAM '7z e -so transfers.csv.gz' DELIMITER ',' CSV HEADER NULL '';

-- hosp schema
\cd ../hosp

\COPY mimiciv_hosp.d_hcpcs FROM PROGRAM '7z e -so d_hcpcs.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.diagnoses_icd FROM PROGRAM '7z e -so diagnoses_icd.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.d_icd_diagnoses FROM PROGRAM '7z e -so d_icd_diagnoses.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.d_icd_procedures FROM PROGRAM '7z e -so d_icd_procedures.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.d_labitems FROM PROGRAM '7z e -so d_labitems.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.drgcodes FROM PROGRAM '7z e -so drgcodes.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.emar_detail FROM PROGRAM '7z e -so emar_detail.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.emar FROM PROGRAM '7z e -so emar.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.hcpcsevents FROM PROGRAM '7z e -so hcpcsevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.labevents FROM PROGRAM '7z e -so labevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.microbiologyevents FROM PROGRAM '7z e -so microbiologyevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.pharmacy FROM PROGRAM '7z e -so pharmacy.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.poe_detail FROM PROGRAM '7z e -so poe_detail.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.poe FROM PROGRAM '7z e -so poe.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.prescriptions FROM PROGRAM '7z e -so prescriptions.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.procedures_icd FROM PROGRAM '7z e -so procedures_icd.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.services FROM PROGRAM '7z e -so services.csv.gz' DELIMITER ',' CSV HEADER NULL '';

-- icu schema
\cd ../icu

\COPY mimiciv_icu.chartevents FROM PROGRAM '7z e -so chartevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.datetimeevents FROM PROGRAM '7z e -so datetimeevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.d_items FROM PROGRAM '7z e -so d_items.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.icustays FROM PROGRAM '7z e -so icustays.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.inputevents FROM PROGRAM '7z e -so inputevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.outputevents FROM PROGRAM '7z e -so outputevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.procedureevents FROM PROGRAM '7z e -so procedureevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
