DROP SCHEMA `NBA_Project`;

CREATE SCHEMA `NBA_Project`;
USE NBA_Project;


CREATE TABLE `NBA_Project`.`User` (
  `u_id` INT NOT NULL AUTO_INCREMENT,
  `u_fname` VARCHAR(100) NOT NULL,
  `u_lname` VARCHAR(100) NOT NULL,
  `u_phone` VARCHAR(45) NOT NULL,
  `u_email` VARCHAR(100) NOT NULL,
  `u_pwd` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE(`u_email`));


CREATE TABLE `NBA_Project`.`Match` (
  `m_id` INT NOT NULL AUTO_INCREMENT,
  `m_timestamp` TIMESTAMP(0) NOT NULL,
  `m_venue` VARCHAR(128) NOT NULL,
  `m_city` VARCHAR(64) NOT NULL,
  PRIMARY KEY (`m_id`));


CREATE TABLE `NBA_Project`.`Manager` (
  `mg_id` INT NOT NULL,
  `mg_joindate` DATE NOT NULL,
  `salary` DECIMAL(12,2) NOT NULL,
  CONSTRAINT `fk_ManagerID`
    FOREIGN KEY (`mg_id`)
    REFERENCES `NBA_Project`.`User` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


-- DROP TABLE `NBA_Project`.`Team`;
CREATE TABLE `NBA_Project`.`Team` (
  `t_id` INT NOT NULL AUTO_INCREMENT,
  `t_name` VARCHAR(64) NOT NULL,
  `t_city` VARCHAR(64) NOT NULL,
  `t_stadiumname` VARCHAR(128) NOT NULL,
  `mg_id` INT NOT NULL,
  PRIMARY KEY (`t_id`),
  CONSTRAINT `fk_Team_ManagerID`
    FOREIGN KEY (`mg_id`)
    REFERENCES `NBA_Project`.`Manager` (`mg_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


-- Drop Table `NBA_Project`.`Player`;
CREATE TABLE `NBA_Project`.`Player` (
  `p_id` INT NOT NULL AUTO_INCREMENT,
  `p_name` VARCHAR(45) NOT NULL,
  `p_phone` VARCHAR(45) NOT NULL,
  `p_birthdate` DATE NOT NULL,
  `p_weight` DECIMAL(6,2) NOT NULL,
  `p_height` DECIMAL(6,2) NOT NULL,
  `t_id` INT NULL,
  PRIMARY KEY (`p_id`),
  CONSTRAINT `fk_TeamID`
    FOREIGN KEY (`t_id`)
    REFERENCES `NBA_Project`.`Team` (`t_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


-- DROP TABLE `NBA_Project`.`Fan`;
CREATE TABLE `NBA_Project`.`Fan` (
  `f_id` INT NOT NULL,
  `fav_team` INT NULL,
  CONSTRAINT `fk_FanID`
    FOREIGN KEY (`f_id`)
    REFERENCES `NBA_Project`.`User` (`u_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Fan_TeamID`
    FOREIGN KEY (`fav_team`)
    REFERENCES `NBA_Project`.`Team` (`t_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


-- DROP TABLE `NBA_Project`.`Stats`;
CREATE TABLE `NBA_Project`.`Stats` (
  `s_id` INT NOT NULL AUTO_INCREMENT,
  `p_id` INT NOT NULL,
  `m_id` INT NOT NULL,
  `tot_points` INT NULL DEFAULT 0,
  `FGA` INT NULL DEFAULT 0,
  `FGM` INT NULL DEFAULT 0,
  `3p%` DECIMAL(6,2) NULL DEFAULT 0,
  `3PA` INT NULL DEFAULT 0,
  `3PM` INT NULL DEFAULT 0,
  PRIMARY KEY (`s_id`),
  CONSTRAINT `fk_PlayerID`
    FOREIGN KEY (`p_id`)
    REFERENCES `NBA_Project`.`Player` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_MatchID`
    FOREIGN KEY (`m_id`)
    REFERENCES `NBA_Project`.`Match` (`m_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


CREATE TABLE `NBA_Project`.`Participates` (
  `m_id` INT NOT NULL,
  `t_id1` INT NOT NULL,
  `t_id2` INT NOT NULL,
  `winner` INT NOT NULL,
  UNIQUE(`m_id`),
  CONSTRAINT `fk_Part_MatchID`
    FOREIGN KEY (`m_id`)
    REFERENCES `NBA_Project`.`Match` (`m_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_TeamID1`
    FOREIGN KEY (`t_id1`)
    REFERENCES `NBA_Project`.`Team` (`t_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_TeamID2`
    FOREIGN KEY (`t_id2`)
    REFERENCES `NBA_Project`.`Team` (`t_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);


-- DROP TABLE `NBA_Project`.`Contract`;
CREATE TABLE `NBA_Project`.`Contract` (
  `c_id` INT NOT NULL AUTO_INCREMENT,
  `mg_id` INT NOT NULL,
  `p_id` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `wage` DECIMAL(12,2) NOT NULL,
  `is_active` TINYINT NULL,
  `duration` DECIMAL(5,2) AS (TIMESTAMPDIFF(YEAR,start_date,end_date)),
  PRIMARY KEY (`c_id`),
  CONSTRAINT `fk_Contract_PlayerID`
    FOREIGN KEY (`p_id`)
    REFERENCES `NBA_Project`.`Player` (`p_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Contract_ManagerID`
    FOREIGN KEY (`mg_id`)
    REFERENCES `NBA_Project`.`Manager` (`mg_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

-- DROP TABLE `NBA_Project`.`Fantasy_Team`;
CREATE TABLE `NBA_Project`.`Fantasy_Team` (
  `ft_id` INT NOT NULL AUTO_INCREMENT,
  `ft_name` VARCHAR(100) NULL,
  `total_points` INT NULL DEFAULT 0,
  `f_id` INT NOT NULL,
  PRIMARY KEY (`ft_id`),
  UNIQUE(`ft_name`),
  CONSTRAINT `fk_Fantasy_Team_Fan`
    FOREIGN KEY (`f_id`)
    REFERENCES `NBA_Project`.`Fan` (`f_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- DROP TABLE `NBA_Project`.`Players_Fantasy_Team`;
CREATE TABLE `NBA_Project`.`Players_Fantasy_Team` (
  `ft_id` INT NULL,
  `p_id` INT NOT NULL,
  CONSTRAINT `fk_Players_Fantasy_Team_FT`
    FOREIGN KEY (`ft_id`)
    REFERENCES `NBA_Project`.`Fantasy_Team` (`ft_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Players_Fantasy_Team_Player`
    FOREIGN KEY (`p_id`)
    REFERENCES `NBA_Project`.`Player` (`p_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `NBA_Project`.`Message` (
  `f_id` INT NOT NULL,
  `msg_timestamp` TIMESTAMP(0) NOT NULL,
  `msg_content` LONGTEXT NOT NULL,
  CONSTRAINT `fk_Message_Fan`
    FOREIGN KEY (`f_id`)
    REFERENCES `NBA_Project`.`Fan` (`f_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE);

 -- Stored Procedures
 -- Login
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NBA_Project`.`login`(input_uemail varchar(100), input_upwd varchar(45))
BEGIN
	SELECT u.u_id FROM `NBA_Project`.`User` as u WHERE u.u_email = input_uemail AND u.u_pwd = input_upwd;
END
$$
DELIMITER ;


-- Signup
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NBA_Project`.`signup`(input_ufname varchar(100), input_ulname varchar(100), input_uphone varchar(45), input_uemail varchar(100), input_upwd varchar(45), inp_ffavteamID INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 0;
	INSERT INTO `NBA_Project`.`User` VALUES (NULL, input_ufname, input_ulname, input_uphone, input_uemail, input_upwd);
	INSERT INTO `NBA_Project`.`Fan` (f_id, fav_team) VALUES ((SELECT LAST_INSERT_ID()), inp_ffavteamID);
	SELECT 1;
END
$$
DELIMITER ;


-- Create Fantasy Team
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NBA_Project`.`create_fantasy_team`(inp_fid INT, inp_ftname VARCHAR(100), inp_pid1 INT, inp_pid2 INT, inp_pid3 INT, inp_pid4 INT, inp_pid5 INT, inp_pid6 INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 0;
	INSERT INTO `NBA_Project`.`Fantasy_Team` values (NULL, inp_ftname, 0, inp_fid);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid1);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid2);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid3);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid4);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid5);
	INSERT INTO `NBA_Project`.`Players_Fantasy_Team` values ((SELECT LAST_INSERT_ID()), inp_pid6);
END
$$
DELIMITER ;

-- View Fantasy Team
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NBA_Project`.`view_fantasy_team`(inp_fid INT)
BEGIN
	SELECT p.p_name AS Player, ft.ft_name as team_name, CAST(SUM(tot_points) AS UNSIGNED) AS total_points
	FROM Fantasy_Team AS ft
	NATURAL JOIN Players_Fantasy_Team AS pft
	NATURAL JOIN Player AS p
	NATURAL JOIN Stats AS s
	WHERE ft.f_id = inp_fid
	GROUP BY s.p_id, ft.ft_id;
END
$$
DELIMITER ;

-- Sign New Contract
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `NBA_Project`.`sign_new_contract`(inp_mgid INT, inp_pid INT, inp_startdate DATE, inp_enddate DATE, inp_wage DECIMAL(12, 2))
BEGIN
	UPDATE `NBA_Project`.`Contract` AS C SET C.is_active = FALSE WHERE C.p_id = inp_pid;
	INSERT INTO `NBA_Project`.`Contract` (mg_id, p_id, start_date, end_date, is_active, wage)
		VALUES(inp_mgid, inp_pid, inp_startdate, inp_enddate, TRUE, inp_wage);
	UPDATE `NBA_Project`.`Player` AS P SET P.t_id = (SELECT T.T_id FROM `NBA_Project`.`Team` AS T WHERE T.mg_id = inp_mgid)
		WHERE P.p_id = inp_pid;
	SELECT 1;
END $$
DELIMITER ;


-- Triggers
-- Dynamic Stats Points
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `set_dynamic_stats` BEFORE INSERT ON `Stats` FOR EACH ROW BEGIN
	SET `NEW`.tot_points = `NEW`.FGM + `NEW`.`3PM`;
	SET `NEW`.`3P%` = (CASE WHEN `NEW`.`3PA`=0 THEN 0 ELSE `NEW`.`3PM`/`NEW`.`3PA`* 100 END);
END $$
DELIMITER ;


-- Update FT Points
DELIMITER $$
CREATE DEFINER=`root`@`localhost` TRIGGER `update_ft_points` AFTER INSERT ON `Stats` FOR EACH ROW BEGIN
	UPDATE `NBA_Project`.`Fantasy_Team` as FT
	SET FT.total_points = FT.total_points + `NEW`.tot_points
	WHERE FT.ft_id in (SELECT PFT.ft_id FROM `NBA_Project`.`Players_Fantasy_Team` AS PFT WHERE PFT.p_id = NEW.p_id);
END $$
DELIMITER ;


-- Views
CREATE OR REPLACE
ALGORITHM = UNDEFINED VIEW `NBA_Project`.`create_new_ft_view` AS
select
    `p`.`p_id` AS `p_id`,
    `p`.`p_name` AS `Player`,
    `t`.`t_name` AS `Team`,
    sum(`s`.`tot_points`) AS `Points`
from
    ((`NBA_Project`.`Player` `p`
join `NBA_Project`.`Team` `t` on
    ((`p`.`t_id` = `t`.`t_id`)))
join `NBA_Project`.`Stats` `s` on
    ((`p`.`p_id` = `s`.`p_id`)))
group by
    `p`.`p_id`,
    `t`.`t_id`
order by
    `Points` desc;
