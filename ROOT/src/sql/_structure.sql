
PRODUCTION


CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `article_type_id` int(11) NOT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `detail` varchar(10000) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `article_image`
--

CREATE TABLE `article_image` (
  `atc_img_id` int(11) NOT NULL,
  `atc_user_id` varchar(32) DEFAULT NULL,
  `atc_img_name` varchar(255) DEFAULT NULL,
  `atc_img_type` varchar(255) DEFAULT NULL,
  `atc_img_size` varchar(255) DEFAULT NULL,
  `atc_img_path` varchar(1024) DEFAULT NULL,
  `atc_time_upload` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `article_tag`
--

CREATE TABLE `article_tag` (
  `article_id` char(3) DEFAULT NULL,
  `tag_id` char(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `article_type`
--

CREATE TABLE `article_type` (
  `article_type_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `authorized_object`
--

CREATE TABLE `authorized_object` (
  `authorized_object_id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `authorized_object_group_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `authorized_object_group`
--

CREATE TABLE `authorized_object_group` (
  `authorized_object_group_id` bigint(20) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `user_create` varchar(30) DEFAULT NULL,
  `user_update` varchar(30) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL,
  `borrow_amout` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `user_borrowid` varchar(32) DEFAULT NULL,
  `date_start` timestamp NULL DEFAULT NULL,
  `date_end` timestamp NULL DEFAULT NULL,
  `location` varchar(1024) DEFAULT NULL,
  `contact_addr` varchar(1024) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_create` varchar(32) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `equipment_id` varchar(32) DEFAULT NULL,
  `remark` varchar(1024) DEFAULT NULL,
  `reasona` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `Message_id` int(255) NOT NULL,
  `Sender_id` varchar(32) NOT NULL,
  `Reciever_id` varchar(32) NOT NULL,
  `Date_time_Message` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Message_text` varchar(1024) DEFAULT NULL,
  `Sender_read_status` char(1) DEFAULT NULL,
  `Reciever_read_status` char(1) DEFAULT NULL,
  `img_path` varchar(1024) DEFAULT NULL,
  `img_message_status` char(1) DEFAULT NULL,
  `like_status` char(1) DEFAULT NULL,
  `file_path` varchar(1024) DEFAULT NULL,
  `file_message_status` char(1) DEFAULT NULL,
  `file_name` varchar(1024) DEFAULT NULL,
  `sticker_path` varchar(1024) DEFAULT NULL,
  `sticker_status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat_theme`
--

CREATE TABLE `chat_theme` (
  `chat_theme_id` int(255) NOT NULL,
  `Owner_chat_id` varchar(1024) DEFAULT NULL,
  `theme` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `chat_user_setting`
--

CREATE TABLE `chat_user_setting` (
  `chat_user_setting_id` int(255) NOT NULL,
  `user_id` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_load_limit` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(255) NOT NULL,
  `details` varchar(1024) DEFAULT NULL,
  `feed_id` int(100) NOT NULL,
  `time_comment` timestamp NULL DEFAULT NULL,
  `time_updated_comment` timestamp NULL DEFAULT NULL,
  `user_comment` varchar(32) NOT NULL,
  `sticker_part` varchar(1024) DEFAULT NULL,
  `commentImage_path` varchar(1025) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `prefix_id` varchar(64) DEFAULT NULL,
  `user_create` varchar(45) DEFAULT NULL,
  `user_update` varchar(45) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `equipment_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `detail` varchar(1024) DEFAULT NULL,
  `item_no` varchar(16) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `note` varchar(1024) DEFAULT NULL,
  `ram` varchar(128) DEFAULT NULL,
  `process` varchar(128) DEFAULT NULL,
  `battery` varchar(128) DEFAULT NULL,
  `hdd` varchar(128) DEFAULT NULL,
  `windows` varchar(64) DEFAULT NULL,
  `serial_no` varchar(64) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `type` varchar(3) DEFAULT NULL,
  `wifiaddress` varchar(128) DEFAULT NULL,
  `lanaddress` varchar(128) DEFAULT NULL,
  `display` varchar(128) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_status`
--

CREATE TABLE `equipment_status` (
  `status` varchar(3) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  `user_create` varchar(45) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `user_update` varchar(45) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_type`
--

CREATE TABLE `equipment_type` (
  `Type` varchar(3) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `user_create` varchar(45) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `user_update` varchar(45) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `expense_id` bigint(20) NOT NULL,
  `expense_group_id` bigint(20) DEFAULT NULL,
  `exp_type_id` varchar(1) NOT NULL,
  `dt_start` timestamp NULL DEFAULT NULL,
  `dt_end` timestamp NULL DEFAULT NULL,
  `dt_by` bigint(20) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `from_location` varchar(255) DEFAULT NULL,
  `from_lat` decimal(20,15) DEFAULT NULL,
  `from_lon` decimal(20,15) DEFAULT NULL,
  `to_location` varchar(255) DEFAULT NULL,
  `to_lat` decimal(20,15) DEFAULT NULL,
  `to_lon` decimal(20,15) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expense_group`
--

CREATE TABLE `expense_group` (
  `expense_group_id` bigint(20) NOT NULL,
  `exp_type_id` varchar(1) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status_id` varchar(1) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `paid_month` smallint(6) DEFAULT NULL,
  `paid_year` int(11) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_travel_type`
--

CREATE TABLE `exp_travel_type` (
  `exp_travel_type_id` bigint(1) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exp_type`
--

CREATE TABLE `exp_type` (
  `exp_type_id` varchar(1) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `faq_id` int(11) NOT NULL,
  `topic` varchar(100) DEFAULT NULL,
  `details` text,
  `author` varchar(32) DEFAULT NULL,
  `time_posted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `faq_cat_id` int(11) DEFAULT NULL,
  `time_updated_post` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `faq_status_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq_category`
--

CREATE TABLE `faq_category` (
  `faq_cat_id` int(11) NOT NULL,
  `faq_cat_name` varchar(50) DEFAULT NULL,
  `faq_cat_user_id` varchar(32) DEFAULT NULL,
  `faq_cat_add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq_image`
--

CREATE TABLE `faq_image` (
  `faq_img_id` int(11) NOT NULL,
  `faq_user_id` varchar(32) DEFAULT NULL,
  `faq_img_name` varchar(255) DEFAULT NULL,
  `faq_img_type` varchar(255) DEFAULT NULL,
  `faq_img_size` varchar(255) DEFAULT NULL,
  `faq_img_path` varchar(1024) DEFAULT NULL,
  `faq_time_upload` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq_status`
--

CREATE TABLE `faq_status` (
  `faq_status_id` int(11) NOT NULL,
  `faq_status_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `idfeedback` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `status` char(1) DEFAULT 'R',
  `description_res` varchar(1024) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `user_create` varchar(45) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `user_update` varchar(45) DEFAULT NULL,
  `unique_key` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feednews`
--

CREATE TABLE `feednews` (
  `feed_id` int(255) NOT NULL,
  `details` varchar(1024) DEFAULT NULL,
  `user_id` varchar(100) NOT NULL,
  `time_posted` timestamp NULL DEFAULT NULL,
  `time_updated_post` timestamp NULL DEFAULT NULL,
  `path_url` varchar(1024) DEFAULT NULL,
  `status_post` int(11) DEFAULT NULL,
  `backgroundType` varchar(100) DEFAULT NULL,
  `backgroundRGB` varchar(100) DEFAULT NULL,
  `backgroundpathid` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feednewslike`
--

CREATE TABLE `feednewslike` (
  `like_id` int(255) NOT NULL,
  `feed_id` int(255) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `reactType` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `feed_post_background`
--

CREATE TABLE `feed_post_background` (
  `feed_post_background_id` int(255) NOT NULL,
  `background_img_path` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_update` timestamp NULL DEFAULT NULL,
  `background_img_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_img_file_type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_upload` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_update` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `used_status` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `file_feedback`
--

CREATE TABLE `file_feedback` (
  `file_idfb` int(11) NOT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `unique_key` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `user_create` varchar(45) DEFAULT NULL,
  `user_update` varchar(45) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `group_chat`
--

CREATE TABLE `group_chat` (
  `Group_chat_id` int(255) NOT NULL,
  `Group_chat_Name` varchar(1024) DEFAULT NULL,
  `Group_Description` varchar(1024) DEFAULT NULL,
  `Group_img_path` varchar(1024) DEFAULT NULL,
  `Group_chat_user_create` varchar(1024) DEFAULT NULL,
  `Group_time_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Group_chat_user_update` varchar(250) DEFAULT NULL,
  `Group_chat_time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `group_chat_member`
--

CREATE TABLE `group_chat_member` (
  `Group_chat_member_id` int(255) NOT NULL,
  `Group_chat_id` int(255) DEFAULT NULL,
  `member_id` varchar(1024) DEFAULT NULL,
  `inviter_member_id` varchar(1024) DEFAULT NULL,
  `member_time_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `favorite_mark` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `group_chat_message`
--

CREATE TABLE `group_chat_message` (
  `Group_chat_message_id` int(255) NOT NULL,
  `Group_chat_id` int(255) DEFAULT NULL,
  `Sender_id` varchar(1024) DEFAULT NULL,
  `Date_time_message` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_message_status` char(1) DEFAULT NULL,
  `image_path` varchar(1024) DEFAULT NULL,
  `file_message_status` char(1) DEFAULT NULL,
  `file_path` varchar(1024) DEFAULT NULL,
  `file_name` varchar(1024) DEFAULT NULL,
  `sticker_message_status` char(1) DEFAULT NULL,
  `sticker_path` varchar(1024) DEFAULT NULL,
  `Group_chat_message` varchar(1024) DEFAULT NULL,
  `information_message_status` char(1) DEFAULT NULL,
  `information_message` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `group_chat_read_like_status`
--

CREATE TABLE `group_chat_read_like_status` (
  `group_chat_read_like_status_id` int(255) NOT NULL,
  `Group_chat_message_id` int(255) DEFAULT NULL,
  `Group_chat_id` int(255) DEFAULT NULL,
  `read_status` char(1) DEFAULT NULL,
  `like_status` char(1) DEFAULT NULL,
  `user_id` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id_date` bigint(10) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `head` varchar(45) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `id_running`
--

CREATE TABLE `id_running` (
  `id` varchar(32) NOT NULL,
  `pk_id` varchar(32) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `running_no` bigint(20) NOT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `inviting`
--

CREATE TABLE `inviting` (
  `idinvite` int(64) NOT NULL,
  `idmeeting` int(64) NOT NULL,
  `member` varchar(1024) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `job_site`
--

CREATE TABLE `job_site` (
  `id_sitejob` int(100) NOT NULL,
  `name_site` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `user_create` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_update` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `leave_id` bigint(20) NOT NULL,
  `leave_type_id` char(1) NOT NULL,
  `leave_status_id` char(1) NOT NULL,
  `half_day` char(1) DEFAULT NULL,
  `user_id` varchar(32) NOT NULL,
  `appr_user_id` varchar(32) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `reason` varchar(1024) DEFAULT NULL,
  `start_time` varchar(5) DEFAULT NULL,
  `end_time` varchar(5) DEFAULT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `no_day` decimal(6,3) NOT NULL,
  `leave_file` varchar(255) DEFAULT NULL,
  `user_create` varchar(32) NOT NULL,
  `user_update` varchar(32) NOT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `leave_type_id` char(1) NOT NULL,
  `leave_type_name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `leave_user`
--

CREATE TABLE `leave_user` (
  `leave_id` bigint(20) NOT NULL,
  `user_id` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(20) NOT NULL,
  `location_name` varchar(255) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `lng` varchar(50) NOT NULL,
  `radius` int(11) DEFAULT NULL,
  `frequency` int(20) DEFAULT NULL,
  `user_create` varchar(200) DEFAULT NULL,
  `time_creaete` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `meeting`
--

CREATE TABLE `meeting` (
  `idmeeting` int(64) NOT NULL,
  `idroom` int(64) NOT NULL,
  `time_start` time DEFAULT NULL,
  `time_end` time DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `user_reserve` varchar(1024) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` bigint(20) NOT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `news_head` varchar(256) DEFAULT NULL,
  `news_description` varchar(2048) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` varchar(4) NOT NULL,
  `department_id` varchar(32) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(1024) NOT NULL,
  `user_create` varchar(32) NOT NULL,
  `user_update` varchar(32) NOT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_id` bigint(20) NOT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(32) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project_function`
--

CREATE TABLE `project_function` (
  `function_id` bigint(20) NOT NULL,
  `function_name` varchar(100) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `project_id` bigint(50) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_update` varchar(32) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `qrcode_list`
--

CREATE TABLE `qrcode_list` (
  `qr_id` int(20) NOT NULL,
  `status` char(1) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role_authorized_object`
--

CREATE TABLE `role_authorized_object` (
  `role_id` varchar(32) NOT NULL,
  `authorized_object_id` varchar(32) NOT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `idroom` int(64) NOT NULL,
  `room_name` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `user_create` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `user_update` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timesheet`
--

CREATE TABLE `timesheet` (
  `id` bigint(1) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `function_id` bigint(20) DEFAULT NULL,
  `OT_time_start` timestamp NULL DEFAULT NULL,
  `OT_time_end` timestamp NULL DEFAULT NULL,
  `OT_description` varchar(1024) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `time_check_in` timestamp NULL DEFAULT NULL,
  `time_check_out` timestamp NULL DEFAULT NULL,
  `status` char(1) DEFAULT 'W',
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `team` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `trainingid` bigint(20) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `hours` double DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL,
  `department_id` varchar(32) DEFAULT NULL,
  `manager_id` varchar(32) DEFAULT NULL,
  `position_id` varchar(4) DEFAULT NULL,
  `employee_id` varchar(8) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `nick_name` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `email_password` varchar(32) DEFAULT NULL,
  `email_enable` varchar(1) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `flag_search` varchar(1) DEFAULT '1',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `work_day_start` char(1) DEFAULT NULL,
  `work_day_end` char(1) DEFAULT NULL,
  `work_time_start` char(5) DEFAULT '9:00',
  `work_time_end` char(5) DEFAULT '18:00',
  `latest_salary` decimal(10,2) DEFAULT NULL,
  `edu_institute_1` varchar(200) DEFAULT NULL,
  `edu_institute_2` varchar(200) DEFAULT NULL,
  `edu_institute_3` varchar(200) DEFAULT NULL,
  `edu_institute_4` varchar(200) DEFAULT NULL,
  `edu_dur_start_1` varchar(4) DEFAULT NULL,
  `edu_dur_start_2` varchar(4) DEFAULT NULL,
  `edu_dur_start_3` varchar(4) DEFAULT NULL,
  `edu_dur_start_4` varchar(4) DEFAULT NULL,
  `edu_dur_end_1` varchar(4) DEFAULT NULL,
  `edu_dur_end_2` varchar(4) DEFAULT NULL,
  `edu_dur_end_3` varchar(4) DEFAULT NULL,
  `edu_dur_end_4` varchar(4) DEFAULT NULL,
  `edu_degree_1` varchar(200) DEFAULT NULL,
  `edu_degree_2` varchar(200) DEFAULT NULL,
  `edu_degree_3` varchar(200) DEFAULT NULL,
  `edu_degree_4` varchar(200) DEFAULT NULL,
  `enable` varchar(1) NOT NULL,
  `leave_quota_1` decimal(3,1) DEFAULT NULL,
  `leave_quota_2` decimal(3,1) DEFAULT NULL,
  `leave_quota_3` decimal(3,1) DEFAULT NULL,
  `leave_quota_lastyear` decimal(3,1) DEFAULT '0.0',
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `email_host` varchar(128) DEFAULT NULL,
  `password_update` timestamp NULL DEFAULT NULL,
  `login_failed` int(11) DEFAULT NULL,
  `last_login_failed_time` timestamp NULL DEFAULT NULL,
  `path` varchar(1024) DEFAULT NULL,
  `facebookid` varchar(64) DEFAULT NULL,
  `line_id` varchar(64) DEFAULT NULL,
  `phone_num` varchar(10) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `id_sitejob` int(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `work_hours`
--

CREATE TABLE `work_hours` (
  `work_hours_id` bigint(20) NOT NULL,
  `work_hours_type` char(1) DEFAULT NULL,
  `work_hours_time_work` timestamp NULL DEFAULT NULL,
  `latitude` varchar(32) DEFAULT NULL,
  `longitude` varchar(32) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `user_agent` text,
  `ip_address` varchar(32) DEFAULT NULL,
  `user_create` varchar(32) DEFAULT NULL,
  `user_update` varchar(32) DEFAULT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL,
  `workinghours` int(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`);

--
-- Indexes for table `article_image`
--
ALTER TABLE `article_image`
  ADD PRIMARY KEY (`atc_img_id`);

--
-- Indexes for table `article_type`
--
ALTER TABLE `article_type`
  ADD PRIMARY KEY (`article_type_id`);

--
-- Indexes for table `authorized_object`
--
ALTER TABLE `authorized_object`
  ADD PRIMARY KEY (`authorized_object_id`);

--
-- Indexes for table `authorized_object_group`
--
ALTER TABLE `authorized_object_group`
  ADD PRIMARY KEY (`authorized_object_group_id`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`borrow_id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`Message_id`);

--
-- Indexes for table `chat_theme`
--
ALTER TABLE `chat_theme`
  ADD PRIMARY KEY (`chat_theme_id`);

--
-- Indexes for table `chat_user_setting`
--
ALTER TABLE `chat_user_setting`
  ADD PRIMARY KEY (`chat_user_setting_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`equipment_id`);

--
-- Indexes for table `equipment_status`
--
ALTER TABLE `equipment_status`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `equipment_type`
--
ALTER TABLE `equipment_type`
  ADD PRIMARY KEY (`Type`);

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`expense_id`);

--
-- Indexes for table `expense_group`
--
ALTER TABLE `expense_group`
  ADD PRIMARY KEY (`expense_group_id`);

--
-- Indexes for table `exp_travel_type`
--
ALTER TABLE `exp_travel_type`
  ADD PRIMARY KEY (`exp_travel_type_id`);

--
-- Indexes for table `exp_type`
--
ALTER TABLE `exp_type`
  ADD PRIMARY KEY (`exp_type_id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`faq_id`),
  ADD KEY `faq_cat_id` (`faq_cat_id`),
  ADD KEY `faq_status_id` (`faq_status_id`);

--
-- Indexes for table `faq_category`
--
ALTER TABLE `faq_category`
  ADD PRIMARY KEY (`faq_cat_id`);

--
-- Indexes for table `faq_image`
--
ALTER TABLE `faq_image`
  ADD PRIMARY KEY (`faq_img_id`);

--
-- Indexes for table `faq_status`
--
ALTER TABLE `faq_status`
  ADD PRIMARY KEY (`faq_status_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`idfeedback`);

--
-- Indexes for table `feednews`
--
ALTER TABLE `feednews`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `feednewslike`
--
ALTER TABLE `feednewslike`
  ADD PRIMARY KEY (`like_id`);

--
-- Indexes for table `feed_post_background`
--
ALTER TABLE `feed_post_background`
  ADD PRIMARY KEY (`feed_post_background_id`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`file_id`);

--
-- Indexes for table `file_feedback`
--
ALTER TABLE `file_feedback`
  ADD PRIMARY KEY (`file_idfb`);

--
-- Indexes for table `group_chat`
--
ALTER TABLE `group_chat`
  ADD PRIMARY KEY (`Group_chat_id`);

--
-- Indexes for table `group_chat_member`
--
ALTER TABLE `group_chat_member`
  ADD PRIMARY KEY (`Group_chat_member_id`);

--
-- Indexes for table `group_chat_message`
--
ALTER TABLE `group_chat_message`
  ADD PRIMARY KEY (`Group_chat_message_id`);

--
-- Indexes for table `group_chat_read_like_status`
--
ALTER TABLE `group_chat_read_like_status`
  ADD PRIMARY KEY (`group_chat_read_like_status_id`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id_date`);

--
-- Indexes for table `id_running`
--
ALTER TABLE `id_running`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inviting`
--
ALTER TABLE `inviting`
  ADD PRIMARY KEY (`idinvite`);

--
-- Indexes for table `job_site`
--
ALTER TABLE `job_site`
  ADD PRIMARY KEY (`id_sitejob`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`leave_id`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`leave_type_id`);

--
-- Indexes for table `leave_user`
--
ALTER TABLE `leave_user`
  ADD PRIMARY KEY (`leave_id`,`user_id`);

--
-- Indexes for table `meeting`
--
ALTER TABLE `meeting`
  ADD PRIMARY KEY (`idmeeting`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_id`);

--
-- Indexes for table `project_function`
--
ALTER TABLE `project_function`
  ADD PRIMARY KEY (`function_id`);

--
-- Indexes for table `qrcode_list`
--
ALTER TABLE `qrcode_list`
  ADD PRIMARY KEY (`qr_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_authorized_object`
--
ALTER TABLE `role_authorized_object`
  ADD PRIMARY KEY (`authorized_object_id`,`role_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`idroom`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `timesheet`
--
ALTER TABLE `timesheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`trainingid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`,`user_id`);

--
-- Indexes for table `work_hours`
--
ALTER TABLE `work_hours`
  ADD PRIMARY KEY (`work_hours_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article_image`
--
ALTER TABLE `article_image`
  MODIFY `atc_img_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `article_type`
--
ALTER TABLE `article_type`
  MODIFY `article_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `Message_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `chat_theme`
--
ALTER TABLE `chat_theme`
  MODIFY `chat_theme_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chat_user_setting`
--
ALTER TABLE `chat_user_setting`
  MODIFY `chat_user_setting_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faq_category`
--
ALTER TABLE `faq_category`
  MODIFY `faq_cat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faq_image`
--
ALTER TABLE `faq_image`
  MODIFY `faq_img_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faq_status`
--
ALTER TABLE `faq_status`
  MODIFY `faq_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `idfeedback` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `feednews`
--
ALTER TABLE `feednews`
  MODIFY `feed_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `feednewslike`
--
ALTER TABLE `feednewslike`
  MODIFY `like_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `feed_post_background`
--
ALTER TABLE `feed_post_background`
  MODIFY `feed_post_background_id` int(255) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `file_feedback`
--
ALTER TABLE `file_feedback`
  MODIFY `file_idfb` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `group_chat`
--
ALTER TABLE `group_chat`
  MODIFY `Group_chat_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `group_chat_member`
--
ALTER TABLE `group_chat_member`
  MODIFY `Group_chat_member_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `group_chat_message`
--
ALTER TABLE `group_chat_message`
  MODIFY `Group_chat_message_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `group_chat_read_like_status`
--
ALTER TABLE `group_chat_read_like_status`
  MODIFY `group_chat_read_like_status_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;
--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id_date` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;
--
-- AUTO_INCREMENT for table `inviting`
--
ALTER TABLE `inviting`
  MODIFY `idinvite` int(64) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `job_site`
--
ALTER TABLE `job_site`
  MODIFY `id_sitejob` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `meeting`
--
ALTER TABLE `meeting`
  MODIFY `idmeeting` int(64) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `project_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `project_function`
--
ALTER TABLE `project_function`
  MODIFY `function_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `idroom` int(64) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `id` bigint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=806;
--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `trainingid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`faq_cat_id`) REFERENCES `faq_category` (`faq_cat_id`),
  ADD CONSTRAINT `faq_ibfk_2` FOREIGN KEY (`faq_status_id`) REFERENCES `faq_status` (`faq_status_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
