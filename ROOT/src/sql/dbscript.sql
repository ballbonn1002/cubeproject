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

-- PROD / UAT -- [5 Mar 2022]

CREATE TABLE `user_rpw`(
   `user_rpw_id` INT(11) NOT NULL AUTO_INCREMENT,
   `user_id` VARCHAR(32) NOT NULL,
   `user_key` VARCHAR(32) NOT NULL,
   `expired` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),      
   PRIMARY KEY (`user_rpw_id`)
);


CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_create` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT current_timestamp(),
  `ticket_url` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expected_result` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actual_result` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `ticket_status_id` int(11) DEFAULT NULL,
  `user_assigned` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_assigned` timestamp NULL DEFAULT NULL,
  `time_success` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`)
);

CREATE TABLE `ticket_status` (
  `ticket_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_status_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ticket_status_id`)
);

INSERT INTO `role_authorized_object`(`role_id`, `authorized_object_id`) VALUES 
('sales', 'dashboard.view'),
('IT', 'dashboard.view'),
('HR', 'dashboard.view'),
('ACCOUNTING', 'dashboard.view'),
('AE', 'dashboard.view'),
('AE2', 'dashboard.view');

ALTER TABLE `timesheet` ADD `project` VARCHAR(32) NULL AFTER `id`;

ALTER TABLE `timesheet` ADD `summary` VARCHAR(32) NULL AFTER `project`;

ALTER TABLE `timesheet` ADD `started_date` DATE NULL AFTER `description`;

ALTER TABLE `timesheet` ADD `timespent` VARCHAR(32) NULL AFTER `started_date`;

-- PROD / UAT -- [12 Apr 2022]




