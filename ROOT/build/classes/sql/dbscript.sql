--14012019
ALTER TABLE `leaves` CHANGE `no_day` `no_day` DECIMAL(6,3) NOT NULL;

--25012019
ALTER TABLE user ADD facebookid VARCHAR(64) NULL DEFAULT NULL AFTER path;

--30012019 Line Login
ALTER TABLE `user` ADD `line_id` VARCHAR(64) NULL DEFAULT NULL;

--31012019 เน€เธ�เธฅเธตเน�เธขเธ�เธฅเธฒเธ�เธดเน€เธจเธฉ เน€เธ�เน�เธ�เธฅเธฒเธญเธทเน�เธ�เน�
UPDATE `leave_type` SET `leave_type_name`="เธฅเธฒเธญเธทเน�เธ�เน�",`description`="เธฅเธฒเธญเธทเน�เธ�เน�"WHERE `leave_type_id` = '2'
-- เน€เธ�เธดเน�เธก เธฅเธฒเธ�เธฑเธ�เธฃเน�เธญเธ�เธ—เธตเน�เน€เธซเธฅเธทเธญเธ�เธฒเธ�เธ�เธตเธ�เน�เธญเธ� เน�เธ� leave_type
INSERT INTO `leave_type`(`leave_type_id`, `leave_type_name`, `description`, `user_create`, `user_update`, `time_create`, `time_update`) VALUES ('6','เธฅเธฒเธ�เธฑเธ�เธฃเน�เธญเธ�เธ—เธตเน�เน€เธซเธฅเธทเธญเธ�เธฒเธ�เธ�เธตเธ�เน�เธญเธ�','เธฅเธฒเธ�เธฑเธ�เธฃเน�เธญเธ�เธ—เธตเน�เน€เธซเธฅเธทเธญเธ�เธฒเธ�เธ�เธตเธ�เน�เธญเธ�','Patipat.n','weerawat.p','2019-01-31','2019-01-31')

--06022019
ALTER TABLE `user` CHANGE `work_time_start` `work_time_start` CHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '9:00';
ALTER TABLE `user` CHANGE `work_time_end` `work_time_end` CHAR(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '18:00';

--27022019 default working time start and end
update `user` set work_time_start = 09.00 , work_time_end = 18.00 where work_time_start is null

--Add equipment_status
CREATE TABLE `equipment_status` (
  `status` VARCHAR(3) NOT NULL,
  `description` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,  
  `user_create` VARCHAR(45) NULL,
  `time_create` TIMESTAMP NULL,
  `user_update` VARCHAR(45) NULL,
  `time_update` TIMESTAMP NULL,
  PRIMARY KEY (`status`));
  
INSERT INTO `equipment_status`
(`status`,`description`,`color`,`user_create`,`time_create`)
VALUES
('A','Available','green-jungle','noppakaw.b','2019-03-22 10:30:00')
,('B','Borrowed','yellow-lemon','noppakaw.b','2019-03-22 10:30:00')
,('C','Corrupted','red-mint','noppakaw.b','2019-03-22 10:30:00')
,('W','Wait for approve','default','noppakaw.b','2019-03-22 10:30:00')
,('L','Lost','dark','noppakaw.b','2019-03-22 10:30:00')
,('F','Fixed','blue','noppakaw.b','2019-03-22 10:30:00')
,('Z','Disabled','grey-mint','noppakaw.b','2019-03-22 10:30:00')


CREATE TABLE `equipment_type` (
  `Type` VARCHAR(3) NOT NULL,
  `description` VARCHAR(45) NULL,
  `user_create` VARCHAR(45) NULL,
  `time_create` TIMESTAMP NULL,
  `user_update` VARCHAR(45) NULL,
  `time_update` TIMESTAMP NULL,
  PRIMARY KEY (`Type`));
  
 INSERT INTO `equipment_type` (`Type`, `description`, `user_create`, `time_create`, `user_update`, `time_update`) 
 VALUES 
 ('c', 'Computer', 'chitsanucha.s', '2019-03-27 12:27:18', NULL, NULL), 
 ('o', 'Other', 'chitsanucha.s', '2019-03-27 12:27:18', NULL, NULL);

--11/9/2019-----------------------------------------------------------------------
CREATE TABLE `article` (
  `article_id` INT NOT NULL,
  `article_type_id` CHAR(1) NOT NULL,
  `topic` VARCHAR(255) NULL,
  `user_id` VARCHAR(32) NULL,
  `detail` TEXT NULL,
  `file_id` BIGINT(20) NULL,
  `user_create` VARCHAR(32) NULL,
  `time_create` TIMESTAMP NULL,
  `user_update` VARCHAR(32) NULL,
  `time_update` TIMESTAMP NULL,
  PRIMARY KEY (`article_id`))CHARSET=utf8;

INSERT INTO `article` (`article_id`, `article_type_id`, `topic`,`user_id`,`detail`,`file_id`,`user_create`,`time_create`, `user_update`, `time_update`) 
 VALUES 
 (1, 2, 'โซดาผสมมะนาว', 'anan.n', 'tejhykutel,sthksjfjsrtkykfjgsfhsrt', NULL,'apichat.s' ,'2019-09-11 17:00:00', NULL, NULL), 
 (2, 1, 'แจ้งจับบุด้าอุลตร้าแมน', 'anan.n', 'sgoodgbnodkuyprayutfdbnaldbn;ndndmn', NULL,'apichat.s' ,'2019-09-11 17:00:00', NULL, NULL);

CREATE TABLE `article_type` (
  `article_type_id` CHAR(1) NOT NULL,
  `name` VARCHAR(128) NULL,
  `description` VARCHAR(255) NULL,
  `user_create` VARCHAR(32) NULL,
  `time_create` TIMESTAMP NULL,
  `user_update` VARCHAR(32) NULL,
  `time_update` TIMESTAMP NULL,
  PRIMARY KEY (`article_type_id`))CHARSET=utf8;

INSERT INTO `article_type` (`article_type_id`, `name`, `description`,`user_create`,`time_create`, `user_update`, `time_update`) 
 VALUES 
 (1, 'ข่าว', 'ก็ข่าวแหละ', 'apichat.s' ,'2019-09-11 17:00:00', NULL, NULL), 
 (2, 'เกร็ดความรู้', 'เกร็ดน่ารู้แหละ', 'apichat.s', '2019-09-11 17:00:00', NULL, NULL),
 (3, 'เทคโนโลยี', 'เทคโนโลยีแหละ', 'apichat.s', '2019-09-11 17:00:00', NULL, NULL),
 (4, 'การศึกษา', 'การศึกษาแหละ', 'apichat.s', '2019-09-11 17:00:00', NULL, NULL),
 (5, 'ธุรกิจ', 'ธุรกิจแหละ', 'apichat.s', '2019-09-11 17:00:00', NULL, NULL);


CREATE TABLE `tag` (
  `tag_id` CHAR(1) NOT NULL,
  `name` VARCHAR(128) NULL,
  `description` VARCHAR(255) NULL,
  `user_create` VARCHAR(32) NULL,
  `time_create` TIMESTAMP NULL,
  `user_update` VARCHAR(32) NULL,
  `time_update` TIMESTAMP NULL,
  PRIMARY KEY (`tag_id`))CHARSET=utf8;

INSERT INTO `tag` (`tag_id`, `name`, `description`,`user_create`,`time_create`, `user_update`, `time_update`) 
 VALUES 
 (1, 'สุขภาพ', 'ก็เกี่ยวกับสุขภาพอ่ะ', 'apichat.s' ,'2019-09-11 17:00:00', NULL, NULL), 
 (2, 'เทคโนโลยี', 'ก็เกี่ยวกับเทคโนโลยีอ่ะ', 'apichat.s', '2019-09-11 17:00:00', NULL, NULL),
 (3, 'วัฒนธรรม', 'ก็เกี่ยวกับวัฒนธรรมอ่ะ', 'apichat.s', '2019-09-11 17:00:00', NULL, NULL);

CREATE TABLE `article_tag` (
  `article_id` CHAR(1) NOT NULL,
  `tag_id` CHAR(1) NOT NULL
   )ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `article_tag` (`article_id`, `tag_id`) 
 VALUES 
 (1,1),
 (1,2),
 (2,3);
 
 ALTER TABLE `user` ADD `leave_quota_lastyear` DECIMAL(3,1) NULL AFTER `leave_quota_3`

 INSERT INTO `article_tag` (`article_id`, `tag_id`) 
 VALUES 
 (1,2);
 
 ALTER TABLE `user` ADD `flag_search` varchar(1) DEFAULT 1 AFTER `address`
 
 --PROD 19 SEP 2019

 ALTER TABLE `tag`
MODIFY COLUMN `tag_id` int

 ALTER TABLE `article_tag`
MODIFY COLUMN `article_id` CHARACTER(3)

 ALTER TABLE `article_tag`
MODIFY COLUMN `tag_id` CHARACTER(3)

 --PROD 25 SEP 2019
 
DELETE FROM authorized_object WHERE `authorized_object_id` = 'address.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'address.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'contact.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'contact.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'cust.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'cust.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'email.send';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'email.server.delete';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'inventroy.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'job.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'job.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'mq.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'mq.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'mqg.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'mqg.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'mypm.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'opt.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'opt.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'other.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'pm.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'pm.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'pm.view.all';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'resource.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'resource.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'salary.approve';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'task.edit';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'task.view';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'webboard.all';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'webboard.product';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'wh.view.all';
DELETE FROM authorized_object WHERE `authorized_object_id` = 'productdetail.edit';


delete from role_authorized_object where authorized_object_id not in (select authorized_object_id from authorized_object);

INSERT INTO `authorized_object` (`authorized_object_id`, `name`, `description`, `time_create`, `time_update`, `authorized_object_group_id`) VALUES ('article.view', 'article.view', 'ดูรายการ article ได้', CURRENT_TIME(), CURRENT_TIME(), '1');

INSERT INTO `authorized_object` (`authorized_object_id`, `name`, `description`, `time_create`, `time_update`, `authorized_object_group_id`) VALUES ('article.edit', 'article.edit', 'แก้ไขรายการ article ได้', CURRENT_TIME(), CURRENT_TIME(), '1');

 --PROD 21 OCT 2019

ALTER TABLE user ADD phone_num varchar(10);
update  user set    phone_num = '0855555555' where  id = 'apichat.s'
 

--PROD 6 NOV 2019

ALTER TABLE user ADD gender char(1);

update user set gender = 'M' where id = 'apichat.s'

-- QRCode Not Use Now
CREATE TABLE `qrcode_list` ( `qr_id` INT(20) NOT NULL , `status` CHAR(1) NULL , `time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`qr_id`))
-- Location table
CREATE TABLE `location` (
  `location_id` int(20) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `lng` varchar(50) NOT NULL,
  `radius` int(11) DEFAULT NULL,
  `frequency` int(20) DEFAULT NULL,
  `user_create` varchar(200) DEFAULT NULL,
  `time_creaete` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- PROD 6 Aug 2020 --

-- faq_category Table [7 August 2020]--
CREATE TABLE `faq_category` (
  `faq_cat_id` INT NOT NULL AUTO_INCREMENT,
  `faq_cat_name` VARCHAR(50) NULL,
  `faq_cat_user_id` VARCHAR(32) NULL,
  `faq_cat_add_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`faq_cat_id`));

-- faq Table [7 August 2020] --
CREATE TABLE `faq` (
  `faq_id` INT NOT NULL AUTO_INCREMENT,
  `topic` VARCHAR(100) NULL,
  `details` TEXT NULL,
  `author` VARCHAR(32) NULL,
  `time_posted` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `faq_cat_id` INT NULL,
  `time_updated_post` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`faq_id`),
  FOREIGN KEY (`faq_cat_id`) REFERENCES faq_category(`faq_cat_id`)
  );

-- faq_image Table [11 August 2020] --
CREATE TABLE `faq_image` (
  `faq_img_id` INT NOT NULL AUTO_INCREMENT,
  `faq_user_id` VARCHAR(32) NULL,
  `faq_img_name` VARCHAR(255) NULL,
  `faq_img_type` VARCHAR(255) NULL,
  `faq_img_size` VARCHAR(255) NULL,
  `faq_img_path` VARCHAR(1024) NULL,
  `faq_time_upload` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`faq_img_id`));

-- article_image Table [19 August 2020] --
CREATE TABLE `article_image` (
  `atc_img_id` INT NOT NULL AUTO_INCREMENT,
  `atc_user_id` VARCHAR(32) NULL,
  `atc_img_name` VARCHAR(255) NULL,
  `atc_img_type` VARCHAR(255) NULL,
  `atc_img_size` VARCHAR(255) NULL,
  `atc_img_path` VARCHAR(1024) NULL,
  `atc_time_upload` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`atc_img_id`));

-- article_type Table [19 August 2020] --
ALTER TABLE `article_type` 
CHANGE COLUMN `article_type_id` `article_type_id` INT NOT NULL AUTO_INCREMENT;
ALTER TABLE `article` 
CHANGE COLUMN `article_type_id` `article_type_id` INT NOT NULL ;

-- article Table [20 August 2020] -- 
ALTER TABLE `article` 
CHANGE COLUMN `detail` `detail` VARCHAR(10000) NULL DEFAULT NULL ;

-- [PROD]

-- faq_status Table [22 October 2020] --

CREATE TABLE `faq_status` (   `faq_status_id` INT NOT NULL AUTO_INCREMENT,   `faq_status_name` VARCHAR(50) NULL,   PRIMARY KEY (`faq_status_id`));

alter table `faq`  add faq_status_id int, add FOREIGN KEY (faq_status_id) REFERENCES `faq_status`(faq_status_id) ON DELETE CASCADE;
insert into `faq_status` value(1, "Wait for Approval");
insert into `faq_status` value(2, "Approved");
insert into `faq_status` value(3, "Rejected");

-- [PROD]
CREATE TABLE `ticket` (
  `ticket_id` INT NOT NULL AUTO_INCREMENT,
  `ticket_name` VARCHAR(50) NULL,
  `user_create` VARCHAR(32) NULL,
  `time_create` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `ticket_url` VARCHAR(120) NULL,
  `description` VARCHAR(500) NULL,
  `expected_result` VARCHAR(250) NULL,
  `actual_result` VARCHAR(250) NULL,
  `file_id` BIGINT NULL,
  `ticket_status_id` INT NULL,
  `user_assigned` VARCHAR(32) NULL,
  `time_assigned` TIMESTAMP NULL,
  `time_success` TIMESTAMP NULL
  PRIMARY KEY (`ticket_id`));
  

  -- ticket_status [21 October 2020] --
  CREATE TABLE `ticket_status` (
  `ticket_status_id` INT NOT NULL AUTO_INCREMENT,
  `ticket_status_name` VARCHAR(45) NULL,
  PRIMARY KEY (`ticket_status_id`));

INSERT INTO `authorized_object` (`authorized_object_id`, `name`, `description`, `time_create`, `time_update`, `authorized_object_group_id`) VALUES ('chart.view', 'Chart.view', 'ดู chart ได้', now(), now(), '1');
INSERT INTO `authorized_object` (`authorized_object_id`, `name`, `description`, `time_create`, `time_update`, `authorized_object_group_id`) VALUES ('support.view', 'support.view', 'ดูหัวข้อ Support', now(), now(), '1');
INSERT INTO `authorized_object` (`authorized_object_id`, `name`, `description`, `time_create`, `time_update`, `authorized_object_group_id`) VALUES ('travel.view', 'travel.view', 'ดูรายการ Travel Expense ได้', now(), now(), '1');



-- project and project_function Table [06 November 2020] --
CREATE TABLE `project` ( `project_id` BIGINT NOT NULL AUTO_INCREMENT , `project_name` VARCHAR(100)  NULL , `description` VARCHAR(500)  NULL, `user_create` VARCHAR(32)  NULL , `time_create` TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP, `user_update` VARCHAR(32)  NULL , `time_update` TIMESTAMP  NULL,PRIMARY KEY (`project_id`)) ENGINE = InnoDB;
CREATE TABLE `project_function` ( `function_id` BIGINT NOT NULL AUTO_INCREMENT , `function_name` VARCHAR(100)  NULL , `status` VARCHAR(32)  NULL , `project_id` BIGINT(50)  NULL , `user_create` VARCHAR(32)  NULL , `time_create` TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP,`user_update` VARCHAR(32)  NULL , `time_update` TIMESTAMP NULL, PRIMARY KEY (`function_id`)) ENGINE = InnoDB;
ALTER TABLE cube.project_function
ADD CONSTRAINT FK_project
FOREIGN KEY (project_id) REFERENCES cube.project(project_id);

-- drop foreign key [11 November 2020] --
ALTER TABLE project_function DROP CONSTRAINT FK_project;

-- timesheeet add pro id func id [16 November 2020] --
AALTER TABLE `timesheet` ADD `project_id` BIGINT NULL AFTER `id`, ADD `function_id` BIGINT NULL AFTER `project_id`;

-- PROD 14 NOV 2020
-- OT CHeck 1 Dec 2020
ALTER TABLE `timesheet`  ADD `OT_time_start` TIMESTAMP NULL  AFTER `function_id`,  ADD `OT_time_end` TIMESTAMP NULL  AFTER `OT_time_start`,  ADD `OT_description` VARCHAR(1024) NULL  AFTER `OT_time_end`;

-- Add username at user table for timesheet implementation
ALTER TABLE user ADD username varchar(20);

-- Add team at timesheet table 
ALTER TABLE timesheet ADD team VARCHAR(40);

-- Add feedNew
CREATE TABLE `feednews` (
  `feed_id` int(255) NOT NULL PRIMARY KEY,
  `details` varchar(1024) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `time_posted` timestamp NULL,
  `time_updated_post` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

  ALTER TABLE `feednews` MODIFY `feed_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- Add chat_message
  
CREATE TABLE `chat_message` (
  `Message_id` int(255) NOT NULL PRIMARY KEY,
  `Sender_id` varchar(32) NOT NULL,
  `Reciever_id` varchar(32) NOT NULL,
  `Date_time_Message` timestamp NULL,
  `Message_text` varchar(1024) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `chat_message` MODIFY `Message_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `chat_message` CHANGE `Date_time_Message` `Date_time_Message` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `chat_message` ADD `Sender_read_status` VARCHAR(50) NULL AFTER `Message_text`, ADD `Reciever_read_status` VARCHAR(50) NULL AFTER `Sender_read_status`;

-- PROD 12 JAN 2021

 -- Add feedNewLike
CREATE TABLE `feednewslike` (
  `like_id` int(255) NOT NULL PRIMARY KEY,
  `feed_id` int(255) NOT NULL,
  `user_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `feednewslike` MODIFY `like_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
-- PROD 14 JAN 2021 

CREATE TABLE `comment` (
  `comment_id` int(255) NOT NULL PRIMARY KEY,
  `details` varchar(1024) NOT NULL,
  `feed_id` int(100) NOT NULL,
  `time_comment` timestamp NULL DEFAULT NULL,
  `time_updated_comment` timestamp NULL DEFAULT NULL,
  `user_comment` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `comment` MODIFY `comment_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- chat_message change read statust to char
ALTER TABLE `chat_message` CHANGE `Sender_read_status` `Sender_read_status` CHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL, CHANGE `Reciever_read_status` `Reciever_read_status` CHAR(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL;
-- add img message field
ALTER TABLE `chat_message` ADD `img_path` VARCHAR(1024) NULL AFTER `Reciever_read_status`, ADD `img_message_status` CHAR(1) NULL AFTER `img_path`;

-- add path_url field 

ALTER TABLE `feednews` ADD `path_url` varchar(1024) DEFAULT NULL;

-- fix default value for last yea leave quota
-- 18/1/2021

ALTER TABLE `user` CHANGE `leave_quota_lastyear` `leave_quota_lastyear` DECIMAL(3,1) NULL DEFAULT '0';
  
-- add reactType field in feednewslike
ALTER TABLE `feednewslike` ADD `reactType` varchar(5) DEFAULT NULL;

-- add status_post

ALTER TABLE `feednews` ADD `status_post` int(11) DEFAULT NULL;


CREATE TABLE `chat_theme` (
  `chat_theme_id` int(255) NOT NULL PRIMARY KEY,
  `Owner_chat_id` varchar(1024) DEFAULT NULL,
  `theme` CHAR(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `chat_theme` CHANGE `chat_theme_id` `chat_theme_id` INT(255) NOT NULL AUTO_INCREMENT;

-- change details feednews can NULL
ALTER TABLE `feednews` CHANGE `details` `details`  	varchar(1024) NULL;
-- add message like_status , file message , sticker
ALTER TABLE `chat_message` ADD `like_status` CHAR(1) NULL;
ALTER TABLE `chat_message` ADD `file_path` VARCHAR(1024) NULL, ADD `file_message_status` CHAR(1) NULL, ADD `file_name` VARCHAR(1024) NULL;
ALTER TABLE `chat_message` ADD `sticker_path` VARCHAR(1024) NULL, ADD `sticker_status` CHAR(1) NULL;

-- add groupchat
CREATE TABLE `group_chat` (
  `Group_chat_id` int(255) NOT NULL PRIMARY KEY,
  `Group_chat_Name` varchar(1024) DEFAULT NULL,
  `Group_Description` VARCHAR(1024) DEFAULT NULL,
  `Group_img_path` varchar(1024) DEFAULT NULL,
  `Group_chat_user_create` varchar(1024) DEFAULT NULL,
  `Group_time_create` timestamp NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `group_chat` CHANGE `Group_time_create` `Group_time_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `group_chat` MODIFY `Group_chat_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;



CREATE TABLE `group_chat_member` (
  `Group_chat_member_id` int(255) NOT NULL PRIMARY KEY,
  `Group_chat_id` int(255) DEFAULT NULL,
  `member_id` varchar(1024) DEFAULT NULL,
  `inviter_member_id` varchar(1024) DEFAULT NULL,
  `member_time_create` timestamp NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `group_chat_member` CHANGE `member_time_create` `member_time_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `group_chat_member` MODIFY `Group_chat_member_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

CREATE TABLE `group_chat_message` (
  `Group_chat_message_id` int(255) NOT NULL PRIMARY KEY,
   `Group_chat_id` int(255) DEFAULT NULL,
  `Sender_id` varchar(1024) DEFAULT NULL,
  `Date_time_message` timestamp NULL,
  `image_message_status` char(1) DEFAULT NULL,
  `image_path` varchar(1024) DEFAULT NULL,
  `file_message_status` char(1) DEFAULT NULL,
  `file_path` varchar(1024) DEFAULT NULL,
  `sticker_message_status` char(1) DEFAULT NULL,
  `sticker_path` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `group_chat_message` CHANGE `Date_time_message` `Date_time_message` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `group_chat_message` MODIFY `Group_chat_message_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

CREATE TABLE `group_chat_read_like_status` (
  `Group_chat_read_like_status_id` int(255) NOT NULL PRIMARY KEY,
  `Group_chat_message_id` int(255) DEFAULT NULL,
  `read_status` char(1) DEFAULT NULL,
  `like_status` char(1) DEFAULT NULL,
  `user_id` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `group_chat_read_like_status` MODIFY `group_chat_read_like_status_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `group_chat_message` ADD `Group_chat_message` VARCHAR(1024) NULL AFTER `sticker_path`;

----- job site 28/1/2021--------
CREATE TABLE `job_site` ( `id_sitejob` INT(100) NOT NULL AUTO_INCREMENT , 
`name` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL , 
`time_create` TIMESTAMP NULL , 
`time_update` TIMESTAMP NULL , 
`user_create` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL , 
`user_update` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL , PRIMARY KEY (`id_sitejob`)

) ENGINE = InnoDB;

ALTER TABLE `group_chat_read_like_status` ADD `Group_chat_id` INT(255) NULL AFTER `Group_chat_message_id`;

----- add sticker_part feednews 29/1/2021--------
ALTER TABLE `comment` ADD `sticker_part` VARCHAR(1024) NULL;
----- change details feednews can Null 29/1/2021--------
ALTER TABLE `comment` CHANGE `details` `details` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL;

-- PROD 29/01/2021 -- SQL code after this PRODUCTION put below.

-- add file_name field
ALTER TABLE `group_chat_message` ADD `file_name` VARCHAR(1024) NULL AFTER `file_path`;
------ user table site job 29/1/2021-----------
ALTER TABLE `user`  ADD `id_sitejob` INT(100) NULL  AFTER `username`;
ALTER TABLE `job_site` CHANGE `name` `name_site` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

-- add group chat information message
ALTER TABLE `group_chat_message` ADD `information_message_status` CHAR(1) NULL AFTER `Group_chat_message`, ADD `information_message` VARCHAR(1024) NULL AFTER `information_message_status`;

-- add commentImage_path field
ALTER TABLE `comment` ADD `commentImage_path` VARCHAR(1025) NULL DEFAULT NULL AFTER `sticker_part`;

--add group chat favorite mark
ALTER TABLE `group_chat_member` ADD `favorite_mark` CHAR(1) NULL AFTER `member_time_create`;

--add group update
ALTER TABLE `group_chat` ADD `Group_chat_user_update` VARCHAR(250) NULL AFTER `Group_time_create`, ADD `Group_chat_time_update` TIMESTAMP NULL DEFAULT NULL AFTER `Group_chat_user_update`;

-- add chat_user_setting table
CREATE TABLE `chat_user_setting` ( `chat_user_setting_id` INT(255) NOT NULL AUTO_INCREMENT ,
`user_id` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ,
`chat_load_limit` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ,
PRIMARY KEY (`chat_user_setting_id`) ) ENGINE = InnoDB

--add background and backgroundrgb
ALTER TABLE `feednews` ADD `backgroundType` varchar(100) DEFAULT NULL;
ALTER TABLE `feednews` ADD `backgroundRGB` varchar(100) DEFAULT NULL;

--add Feed Post Background table

CREATE TABLE `feed_post_background` ( `feed_post_background_id` INT(255) NOT NULL AUTO_INCREMENT ,
`background_img_path` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL ,
`time_create` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
`time_update` TIMESTAMP NULL , 
`background_img_name` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ,
`background_img_file_type` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`user_upload` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`user_update` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
`used_status` CHAR(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
PRIMARY KEY (`feed_post_background_id`) ) ENGINE = InnoDB


--add background path id in feed
ALTER TABLE `feednews` ADD `backgroundpathid` VARCHAR(100) NULL AFTER `backgroundRGB`;


-- PROD : 3 MAR 2021 -- Any changing sql script, put below:


-4/3/2021
ALTER TABLE `equipment` ADD `wifiaddress` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `type`, ADD `lanaddress` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `wifiaddress`;

-19/3/2021
ALTER TABLE `equipment` ADD `display` VARCHAR(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `lanaddress`;


--add inviting
-26/8/2564
CREATE TABLE `inviting` ( `idinvite` INT(64) NOT NULL AUTO_INCREMENT , `idmeeting` INT(64) NOT NULL , `member` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , PRIMARY KEY (`idinvite`)) ENGINE = InnoDB;

--add room
-26/8/2564
CREATE TABLE `room` ( `idroom` INT(64) NOT NULL AUTO_INCREMENT , `room_name` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_create` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `user_update` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , `time_create` TIMESTAMP NULL , `time_update` TIMESTAMP NULL , PRIMARY KEY (`idroom`)) ENGINE = InnoDB;

--add meeting
-26/8/2564
CREATE TABLE `meeting` ( `idmeeting` INT(64) NOT NULL AUTO_INCREMENT , `idroom` INT(64) NOT NULL , `time_start` TIME NULL , `time_end` TIME NULL , `date` TIMESTAMP NULL , `user_reserve` VARCHAR(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL , PRIMARY KEY (`idmeeting`)) ENGINE = InnoDB;

-- PROD/UAT
CREATE TABLE `training` (
  `trainingid` bigint(20) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `hours` int(3) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `lecturer` varchar(255) DEFAULT NULL,
  `detail` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `training` (`trainingid`, `user_id`, `title`, `hours`, `start_date`, `end_date`, `user_update`, `time_update`, `user_create`, `time_create`, `location`, `lecturer`, `detail`) VALUES
(1, 'thanet.s', 'Java', 8, '2021-06-01', '2021-06-30', 'thanet.s', '2021-08-11 08:28:54', 'thanet.s', '2021-07-01 03:00:10', 'homeee', 'aum', 'hutsss5555hutsss5555hutsss5555hutsss5555hutsss5555hutsss5555hutsss5555hutsss5555hutsss5555hutsss5555hutsss5555'),
(2, 'thanet.s', 'JSP', 4, '2021-07-02', '2021-07-02', 'thanet.s', '2021-07-02 03:00:10', 'thanet.s', '2021-07-02 03:00:10', NULL, NULL, NULL),
(3, 'thanet.s', 'Python', 5, '2021-07-03', '2021-07-04', 'Milk.HR', '2021-07-05 03:03:11', 'Milk.HR', '2021-07-05 03:03:11', NULL, NULL, NULL),
(4, 'thanet.s', 'C+', 9, '2021-07-12', '2021-07-13', 'thanet.s', '2021-08-11 07:02:07', 'Milk.HR', '2021-07-13 03:03:11', '', '', ''),
(5, 'thanet.s', 'PHP', 3, '2021-07-14', '2021-07-15', 'thanet.s', '2021-07-15 03:06:30', 'thanet.s', '2021-07-15 03:06:30', NULL, NULL, NULL),
(6, 'thanet.s', 'React', 2, '2021-07-16', '2021-07-17', 'Kookkik.HR', '2021-07-17 03:06:30', 'Kookkik.HR', '2021-07-17 03:06:30', NULL, NULL, NULL),
(7, 'thanet.s', 'SpringFramework', 10, '2021-07-19', '2021-07-22', 'thanet.s', '2021-07-23 03:06:30', 'thanet.s', '2021-07-23 03:06:30', NULL, NULL, NULL),
(8, 'thanet.s', 'StrutsFramewor', 18, '2021-07-26', '2021-07-28', 'thanet.s', '2021-08-11 07:01:27', 'Ploy.HR', '2021-07-29 03:06:30', '', '', 'sss'),
(11, 'aum.r', 'HMH', 3, '2021-08-11', '2021-08-11', 'aum.r', '2021-08-03 08:28:27', NULL, '2021-08-03 08:28:27', 'home', 'aum', 'descrpit'),
(12, 'aum.r', 'eafef', 3, '2021-08-25', '2021-08-25', 'aum.r', '2021-08-03 08:36:38', NULL, '2021-08-03 08:36:38', 'hunt', 'sad', 'gg'),
(13, 'aum.r', 'Training', 2, '2021-08-24', '2021-08-24', 'IT', '2021-08-03 08:39:16', 'IT', '2021-08-03 08:39:16', '555', 'GoodGame', 'wad'),
(14, 'aum.r', 'Bangkokasd', 3, '2021-08-11', '2021-08-11', 'thanet.s', '2021-08-05 04:05:31', 'kunanon.r', '2021-08-03 08:42:03', 'thailandsss', 'bangkok', 'thaisssadasd'),
(16, 'aum.r', 'awdwd', 2, '2021-08-23', '2021-08-23', 'thanet.s', '2021-08-11 04:27:24', 'thanet.s', '2021-08-11 04:23:07', 'awd', '55555', 'awdwdwss'),
(17, 'aum.r', 'test', 4, '2021-08-09', '2021-08-11', 'thanet.s', '2021-08-11 04:28:46', 'thanet.s', '2021-08-11 04:28:21', 'test', 'test', 'test'),
(18, 'aum.r', 'home', 4, '2021-08-23', '2021-08-23', 'thanet.s', '2021-08-11 07:07:49', 'thanet.s', '2021-08-11 07:07:49', 'ad', 'home', 'sad'),
(19, 'aum.r', 'helper', 1, '2021-08-23', '2021-08-23', 'thanet.s', '2021-08-11 07:09:08', 'thanet.s', '2021-08-11 07:09:08', 'facebook', 'ss', 'facebook'),
(20, 'aum.r', 'helperDev', 1, '2021-08-23', '2021-08-23', 'thanet.s', '2021-08-11 07:09:31', 'thanet.s', '2021-08-11 07:09:31', 'facebook', 'ss', 'facebook'),
(21, 'aum.r', 'document', 1, '2021-08-24', '2021-08-24', 'thanet.s', '2021-08-11 07:10:17', 'thanet.s', '2021-08-11 07:10:17', 'document', 'dd', 'document'),
(22, 'Thanet.s', 'Java', 3, '2021-08-18', '2021-08-18', 'thanet.s', '2021-08-11 07:32:22', 'thanet.s', '2021-08-11 07:32:22', 'sabc', 'abc', 'abc'),
(23, 'Thanet.s', 'abc', 3, '2021-08-18', '2021-08-18', 'thanet.s', '2021-08-11 07:32:46', 'thanet.s', '2021-08-11 07:32:46', 'sabc', 'abc', 'abc'),
(24, 'Thanet.s', 'thanet', 3, '2021-08-17', '2021-08-17', 'thanet.s', '2021-09-06 12:56:45', 'thanet.s', '2021-08-11 07:33:12', 'thanet', 'thanet', 'thanet'),
(25, 'Thanet.s', 'thanet', 4, '2021-08-17', '2021-08-17', 'thanet.s', '2021-08-11 07:33:41', 'thanet.s', '2021-08-11 07:33:41', 'thanetthanet', 'thanet', 'thanetthanet'),
(26, 'aum.r', '50005', 1, '2021-08-11', '2021-08-11', 'thanet.s', '2021-08-11 07:34:05', 'thanet.s', '2021-08-11 07:34:05', 'asd', 'ss', 'zxc'),
(27, 'Thanet.s', 'yummy', 5, '2021-08-24', '2021-08-24', 'thanet.s', '2021-08-11 07:35:34', 'thanet.s', '2021-08-11 07:35:34', 'yummy', 'yummy', 'yummy'),
(28, 'Thanet.s', 'bbbbb', 3, '2021-08-25', '2021-08-25', 'thanet.s', '2021-08-11 07:45:39', 'thanet.s', '2021-08-11 07:45:39', 'bbbbb', 'bbbbb', 'bbbbb'),
(29, 'pimrat.p', 'dd', 3, '2021-08-25', '2021-08-25', 'thanet.s', '2021-08-11 07:56:28', 'thanet.s', '2021-08-11 07:56:28', 'dd', 'dd', 'dd'),
(30, 'Nitikarn.v', 'sad', 3, '2021-08-23', '2021-08-23', 'thanet.s', '2021-08-11 07:58:51', 'thanet.s', '2021-08-11 07:58:51', 'sad', 'sad', 'asd'),
(31, 'Pongotorn.k', 'awdwd', 5, '2021-09-12', '2021-09-12', 'thanet.s', '2021-09-09 04:13:02', 'thanet.s', '2021-09-09 04:13:02', 'awdd', 'eawd', 'awdd');

INSERT INTO `authorized_object` (`authorized_object_id`,`name`,`description`,`time_create`,`time_update`,`authorized_object_group_id`) VALUES
('training.view','training.view','My Training','2021-08-03 14:44:55','2021-08-03 14:44:55','1'),
('trainingAdmin.view','trainingAdmin.view','Training for Admin','2021-08-03 14:44:55','2021-08-03 14:44:55','1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`trainingid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `trainingid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;