CREATE DATABASE TEST;

CREATE TABLE user (
email VARCHAR(50) PRIMARY KEY,
password VARCHAR(100) NOT NULL,
nickname VARCHAR(20) NOT NULL UNIQUE,
tel_number VARCHAR(15) NOT NULL UNIQUE,
address TEXT NOT NULL,
address_detail TEXT,
profile_image TEXT,
agreed_personal BOOLEAN NOT NULL
);

CREATE TABLE board (
board_number INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255) NOT NULL,
contents TEXT NOT NULL,
write_datetime DATETIME NOT NULL DEFAULT now(),
favorite_count INT NOT NULL DEFAULT 0,
comment_count INT NOT NULL DEFAULT 0,
view_count INT NOT NULL DEFAULT 0,
writer_email VARCHAR(50) NOT NULL,      
FOREIGN KEY (writer_email) REFERENCES user (email)
);

CREATE TABLE comment (
comment_number INT PRIMARY KEY,
contents TEXT NOT NULL,
write_datetime DATETIME NOT NULL DEFAULT now(),
user_email VARCHAR(50) NOT NULL,	
borad_number INT NOT NULL,			
FOREIGN KEY (user_email) REFERENCES user (email),
FOREIGN KEY (borad_number) REFERENCES board (board_number)
);

CREATE TABLE favorite (
user_email VARCHAR(50),			
board_board_number INT, 		
PRIMARY KEY (user_email, board_board_number),
FOREIGN KEY (user_email) REFERENCES user (email),
FOREIGN KEY (board_board_number) REFERENCES board (board_number)
);

CREATE TABLE board_image (
sequence INT PRIMARY KEY AUTO_INCREMENT,
board_number INT NOT NULL,		
image_url TEXT,
FOREIGN KEY (board_number) REFERENCES board (board_number)
);

CREATE TABLE serarch_log (
sequence INT PRIMARY KEY,
serarch_word TEXT NOT NULL,
relation_word TEXT,
relation BOOLEAN NOT NULL
);





