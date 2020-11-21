CREATE DATABASE STUDY_CAFE;

USE STUDY_CAFE;

CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content`  text COLLATE utf8mb4_general_ci NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  `UserId` int NOT NULL,
  `CategoryId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commentCol` text COLLATE utf8mb4_general_ci NOT NULL,
  `createdDate` datetime NOT NULL,
  `updatedDate` datetime NOT NULL,
  `PostId` int DEFAULT NULL,
  `PostUserId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `comment_ibfk1` FOREIGN KEY (`PostId`) REFERENCES `post` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk2` FOREIGN KEY (`PostUserId`) REFERENCES `post` (`UserId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `study_cafe`.`post` (`id`, `title`, `content`, `createdDate`, `updatedDate`, `UserId`, `CategoryId`) VALUES ('1', '첫번째 게시글', '안녕하세요', '20-11-19 01:26:37', '20-11-19 01:26:37', '1', '1');
