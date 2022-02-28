-- SQL SCRIPT
-- Any sql script after production 2022-02-07 here:

-- PROD 2022-02-07


ALTER TABLE `project` ADD `status` CHAR(1) NULL AFTER `description`;

--update all value of status from ACTIVE -> 1
UPDATE `project` SET `status` = '1';
ALTER TABLE `project` CHANGE `status` `status` CHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;

--update all value of status from ACTIVE -> 1
UPDATE `project_function` SET `status` = '1';
ALTER TABLE `project_function` CHANGE `status` `status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;


SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

CREATE `user_rpw`(
   `user_rpw_id` INT(11) NOT NULL AUTO_INCREMENT,
   `user_id` VARCHAR(32) NOT NULL,
   `user_key` VARCHAR(32) NOT NULL,
   `expired` timestamp NOT NULL,      
   PRIMARY KEY (`user_rpw_id`)
);