-- SQL SCRIPT

-- PROD / UAT -- [14 June 2022]


ALTER TABLE user ADD title_name_th VARCHAR(10) NULL DEFAULT NULL AFTER id_sitejob, 
ADD title_name_en VARCHAR(10) NULL DEFAULT NULL AFTER title_name_th, 
ADD name_en VARCHAR(200) NULL DEFAULT NULL AFTER title_name_en, 
ADD nick_name_en VARCHAR(32) NULL DEFAULT NULL AFTER name_en, 
ADD emergency_contact VARCHAR(200) NULL DEFAULT NULL AFTER nick_name_en, 
ADD emergency_phone VARCHAR(10) NULL DEFAULT NULL AFTER emergency_contact, 
ADD employee_type_id VARCHAR(32) NULL DEFAULT NULL AFTER emergency_phone, 
ADD social_security VARCHAR(1) NULL DEFAULT NULL AFTER employee_type_id, 
ADD withholding DECIMAL(10,2) NULL DEFAULT NULL AFTER social_security, 
ADD withholding_auto VARCHAR(1) NULL DEFAULT NULL AFTER withholding, 
ADD tax_deduction VARCHAR(1) NULL DEFAULT NULL AFTER withholding_auto, 
ADD transfer_type VARCHAR(10) NULL DEFAULT NULL AFTER tax_deduction, 
ADD bank VARCHAR(100) NULL DEFAULT NULL AFTER transfer_type, 
ADD bank_type VARCHAR(1) NOT NULL AFTER bank, 
ADD bank_number VARCHAR(12) NULL DEFAULT NULL AFTER bank_type, 
ADD bank_branch VARCHAR(100) NULL DEFAULT NULL AFTER bank_number, 
ADD citizen_id VARCHAR(13) NOT NULL AFTER bank_branch, 
ADD passport_id VARCHAR(10) NOT NULL AFTER citizen_id;
