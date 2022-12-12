USE DBSysLab;

CREATE TABLE IF NOT EXISTS user (
	username VARCHAR(255) NOT NULL PRIMARY KEY,
    password VARCHAR(255)
);


INSERT INTO `DBSysLab`.`user` (`username`, `password`) VALUES ('user1', 'pass1');
INSERT INTO `DBSysLab`.`user` (`username`, `password`) VALUES ('user2', 'pass2');

