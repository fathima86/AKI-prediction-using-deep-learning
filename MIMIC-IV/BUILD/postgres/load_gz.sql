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


\COPY mimiciv_core.admissions FROM PROGRAM 'gzip -dc admissions.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_core.patients FROM PROGRAM 'gzip -dc patients.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_core.transfers FROM PROGRAM 'gzip -dc transfers.csv.gz' DELIMITER ',' CSV HEADER NULL '';

-- hosp schema
\cd ../hosp

\COPY mimiciv_hosp.d_hcpcs FROM PROGRAM 'gzip -dc d_hcpcs.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.diagnoses_icd FROM PROGRAM 'gzip -dc diagnoses_icd.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.d_icd_diagnoses FROM PROGRAM 'gzip -dc d_icd_diagnoses.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.d_icd_procedures FROM PROGRAM 'gzip -dc d_icd_procedures.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.d_labitems FROM PROGRAM 'gzip -dc d_labitems.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.drgcodes FROM PROGRAM 'gzip -dc drgcodes.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.emar_detail FROM PROGRAM 'gzip -dc emar_detail.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.emar FROM PROGRAM 'gzip -dc emar.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.hcpcsevents FROM PROGRAM 'gzip -dc hcpcsevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.labevents FROM PROGRAM 'gzip -dc labevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.microbiologyevents FROM PROGRAM 'gzip -dc microbiologyevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.pharmacy FROM PROGRAM 'gzip -dc pharmacy.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.poe_detail FROM PROGRAM 'gzip -dc poe_detail.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.poe FROM PROGRAM 'gzip -dc poe.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.prescriptions FROM PROGRAM 'gzip -dc prescriptions.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.procedures_icd FROM PROGRAM 'gzip -dc procedures_icd.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_hosp.services FROM PROGRAM 'gzip -dc services.csv.gz' DELIMITER ',' CSV HEADER NULL '';

-- icu schema
\cd ../icu

\COPY mimiciv_icu.chartevents FROM PROGRAM 'gzip -dc chartevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.datetimeevents FROM PROGRAM 'gzip -dc datetimeevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.d_items FROM PROGRAM 'gzip -dc d_items.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.icustays FROM PROGRAM 'gzip -dc icustays.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.inputevents FROM PROGRAM 'gzip -dc inputevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.outputevents FROM PROGRAM 'gzip -dc outputevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
\COPY mimiciv_icu.procedureevents FROM PROGRAM 'gzip -dc procedureevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
