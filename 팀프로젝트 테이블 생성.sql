use t1_project;
CREATE DATABASE `t1_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `t1_account` (
  `m_id` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `profile_img` varchar(200) DEFAULT '\\manageimage\\defaultimg.png',
  `m_name` varchar(40) NOT NULL,
  `m_age` int DEFAULT NULL,
  `m_tel` varchar(40) DEFAULT NULL,
  `m_email` varchar(40) NOT NULL,
  `m_gender` char(1) NOT NULL,
  `m_nickname` varchar(40) NOT NULL,
  `m_birthday` varchar(40) NOT NULL,
  `m_birthmm` varchar(45) NOT NULL,
  `m_birthdd` varchar(45) NOT NULL,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changeDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) DEFAULT 'm',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `t1_notice` (
  `b_no` varchar(40) NOT NULL,
  `b_title` varchar(40) NOT NULL,
  `b_content` varchar(300) NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `changeDate` timestamp  DEFAULT NULL DEFAULT CURRENT_TIMESTAMP,
  `b_view` int  DEFAULT NULL,
  PRIMARY KEY (`b_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t1_question` (
  `q_no` varchar(40) NOT NULL,
  `q_title` varchar(40) NOT NULL,
  `q_content` varchar(300) NOT NULL,
  `m_id` varchar(40) NOT NULL,
  `createDate` timestamp DEFAULT NULL DEFAULT CURRENT_TIMESTAMP,
  `a_createDate` timestamp DEFAULT NULL DEFAULT CURRENT_TIMESTAMP,
   `a_content` varchar(300) DEFAULT NULL,
  `b_view` int DEFAULT NULL,
  PRIMARY KEY (`q_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t1_photo` (
  `p_no` varchar(40) NOT NULL,
  `m_id` varchar(40) NOT NULL,
  `p_img1` blob,
  `p_img2` blob,
   `p_img3` blob,
   `p_img4` blob,
  `p_img5` blob,
  `createDate` timestamp DEFAULT NULL DEFAULT CURRENT_TIMESTAMP,
  `changeDate` timestamp  DEFAULT NULL DEFAULT CURRENT_TIMESTAMP,
  `p_name` datetime DEFAULT NULL,
  PRIMARY KEY (`p_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `t1_planner` (
  `p_no` varchar(40) NOT NULL,
  `mbti_ei` varchar(40) NOT NULL,
  `mbti_jp` varchar(40) NOT NULL,
  `adress` varchar(300) NOT NULL,
  `s_calendar` date DEFAULT NULL,
  `s_daytime` datetime DEFAULT NULL,
  `m_id` varchar(40) NOT NULL,
  `b_name` varchar(100) NOT NULL,
  `b_add` varchar(100) NOT NULL,
  `b_jibun` varchar(100) NOT NULL,
  `b_tel` varchar(100) NOT NULL,
  `search` varchar(300) NOT NULL,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `changeDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`p_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
SELECT * FROM teamproject.t1_planner;

CREATE TABLE `t1_bucket` (
  `m_id` varchar(40) NOT NULL,
  `b_name` varchar(100) NOT NULL,
  `b_add` varchar(100) NOT NULL,
  `b_jibun` varchar(100) NOT NULL,
  `b_tel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `t1_managerphoto` (
  `i_name` varchar(40) NOT NULL,
  `i_img` blob,
  PRIMARY KEY (`i_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



