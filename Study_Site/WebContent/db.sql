CREATE DATABASE STUDY_CAFE;

USE STUDY_CAFE;

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post` (
  `id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_post_user1_idx` (`user_id`),
  CONSTRAINT `fk_post_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `category` (
  `id` int NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  `post_id` int NOT NULL,
  `post_user_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`post_user_id`),
  CONSTRAINT `fk_comment_post1` FOREIGN KEY (`post_id`, `post_user_id`) REFERENCES `post` (`id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `post_category` (
  `post_user_id` int NOT NULL,
  `category_id` int NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  KEY `fk_post_category_post1_idx` (`post_user_id`),
  KEY `fk_post_category_category1_idx` (`category_id`),
  CONSTRAINT `fk_post_category_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_post_category_post1` FOREIGN KEY (`post_user_id`) REFERENCES `post` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;