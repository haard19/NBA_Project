SET SQL_MODE='ALLOW_INVALID_DATES';

-- User
-- CALL NBA_Project.signup('Army', 'Patel', '9201241738', 'army.patel@yahoo.com', 'password1');
-- pass_1$#34: 4ace452a5b7a3cf8005ab663294695c7
insert into NBA_Project.User(u_fname,u_lname,u_phone,u_email,u_pwd) values ('Doc', 'Revers', '6501239277', 'doc_r@gmail.com', '4ace452a5b7a3cf8005ab663294695c7');
-- CALL NBA_Project.signup('Subhangi', 'Kumar', '7151531735', 'subhangikumar123@yahoo.com', 'password2');
-- CALL NBA_Project.signup('Priya', 'Sood', '2121241739', 'priya1324@google.com', 'pwd12341234');
-- password2312: cc5d62fe6b2a54d1b4487689831aa4fa
insert into NBA_Project.User(u_fname,u_lname,u_phone,u_email,u_pwd) values ('Quin', 'Synder', '4156281984', 'q_syn_der@yahoo.com', 'cc5d62fe6b2a54d1b4487689831aa4fa');
-- passwordTom123: 687c7de66dab105a657df3a4ef7dda48
insert into NBA_Project.User(u_fname,u_lname,u_phone,u_email,u_pwd) values ('Tom', 'Thibodeau', '1236281124', 'th_tom_23@gmail.com', '687c7de66dab105a657df3a4ef7dda48');
-- password221Steve: d72ec40a244236891276c18f43079e74
insert into NBA_Project.User(u_fname,u_lname,u_phone,u_email,u_pwd) values ('Steve', 'Kerr', '9988844321', 's_kerr@gmail.com', 'd72ec40a244236891276c18f43079e74');
-- passwordFV123: 023ee50d55847a9d0b68eb96da0167f2
insert into NBA_Project.User(u_fname,u_lname,u_phone,u_email,u_pwd) values ('Frank', 'Vogel', '1221344356', 'f_vogel@gmail.com', '023ee50d55847a9d0b68eb96da0167f2');


-- Manager
insert into NBA_Project.Manager values (1, '2015-02-21', 250000.00);
insert into NBA_Project.Manager values (2, '2017-10-11', 150000.00);
insert into NBA_Project.Manager values (3, '2018-09-01', 300000.00);
insert into NBA_Project.Manager values (4, '2016-05-16', 270000.00);
insert into NBA_Project.Manager values (5, '2019-01-20', 250000.00);


-- Match
insert into NBA_Project.Match(m_timestamp, m_venue, m_city) values ('2020-02-21 20:30:00', 'Wells Fargo Center', 'Philadelphia');
insert into NBA_Project.Match(m_timestamp, m_venue, m_city) values ('2020-11-12 19:00:00', 'Vivint Arena', 'Salt Lake City');
insert into NBA_Project.Match(m_timestamp, m_venue, m_city) values ('2020-02-21 17:15:00', 'Madison Square Garden', 'New York');
insert into NBA_Project.Match(m_timestamp, m_venue, m_city) values ('2020-02-21 16:00:00', 'Chase Center', 'San Francisco');
insert into NBA_Project.Match(m_timestamp, m_venue, m_city) values ('2020-02-21 18:30:00', 'STAPLES Center', 'Los Angeles');


-- Team
insert into NBA_Project.Team(t_name,t_city, t_stadiumname, mg_id) values ('Philadelphia 76ers', 'Philadelphia', 'Wells Fargo Center', 1);
insert into NBA_Project.Team(t_name,t_city, t_stadiumname, mg_id) values ('Utah Jazz', 'Salt Lake City', 'Vivint Arena', 2);
insert into NBA_Project.Team(t_name,t_city, t_stadiumname, mg_id) values ('New York Knicks', 'New York', 'Madison Square Garden', 3);
insert into NBA_Project.Team(t_name,t_city, t_stadiumname, mg_id) values ('Golden State Warriors', 'San Francisco', 'Chase Center', 4);
insert into NBA_Project.Team(t_name,t_city, t_stadiumname, mg_id) values ('Los Angeles Lakers', 'Los Angeles', 'STAPLES Center', 5);


-- Player
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Ben Simmons', '1231231234', '1989-02-21', 180.5, 6.4, 1);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Seth Curry', '4356736783', '1985-06-02', 175.3, 6.2, 1);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Georges Niang', '4523769483', '1993-02-11', 188.5, 6.6, 1);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Danny Green', '6758308492', '1991-04-21', 184.7, 5.11, 1);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Jaden Springer', '7058372957', '1989-07-01', 182.6, 6.3, 1);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Paul Reed', '4526569493', '1988-02-02', 180.5, 5.10, 1);

insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Jordan Clerkson', '8350736776', '1984-11-02', 175.3, 6.1, 2);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Rudy Gay', '4223719403', '1991-10-01', 188.5, 6.2, 2);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Rudy Gobert', '6758308492', '1990-12-25', 184.7, 5.11, 2);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Mike Conley', '9051372557', '1989-03-18', 182.6, 6.4, 2);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Donovan Mitchell', '1234567890', '1986-03-08', 182.1, 5.4, 2);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Joe Ingles', '7897778991', '1995-09-18', 180.2, 6.9, 2);

insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Derrick Rose', '1231231230', '1989-02-11', 180.3, 6.1, 3);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Kemba Walker', '4356736711', '1985-05-02', 178.0, 6.0, 3);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('RJ Barrett', '4523769488', '1993-07-11', 188.2, 5.6, 3);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Mitchell Robinson', '1158308492', '1982-04-21', 180.1, 5.7, 3);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Evan Fournier', '7058372917', '1986-07-01', 162.6, 6.0, 3);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Kevin Knox', '4526569422', '1988-02-02', 180.5, 5.10, 3);

insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Stephen Curry', '8350736789', '1984-11-02', 175.1, 5.1, 4);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Clay Thompson', '4223711103', '1991-06-11', 181.5, 6.7, 4);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Jordan Poole', '6711308492', '1997-12-15', 181.2, 6.10, 4);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('James Wiseman', '9051372513', '1982-11-08', 181.2, 5.4, 4);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Daniel Lee', '9998887777', '1989-10-18', 182.9, 6.4, 4);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Draymond Green', '9876543210', '1998-09-22', 177.2, 6.2, 4);

insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('LeBron James', '8350736789', '1984-11-02', 175.1, 5.1, 5);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Russell Westbrook', '4223711103', '1991-06-11', 181.5, 6.7, 5);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Carmelo Anthony', '6711308492', '1997-12-15', 181.2, 6.10, 5);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Anthony Davis', '9051372513', '1982-11-08', 181.2, 5.4, 5);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Austin Reeves', '9998887777', '1989-10-18', 182.9, 6.4, 5);
insert into NBA_Project.Player(p_name, p_phone, p_birthdate, p_weight, p_height, t_id) values ('Dwight Howard', '9876543210', '1998-09-22', 177.2, 6.2, 5);


-- Participate
insert into NBA_Project.Participates values (1, 1, 2, 1);
insert into NBA_Project.Participates values (2, 3, 4, 4);
insert into NBA_Project.Participates values (3, 1, 4, 4);
insert into NBA_Project.Participates values (4, 2, 5, 5);
insert into NBA_Project.Participates values (5, 3, 5, 3);


-- Contract
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(1, 1, 350000.00, '2020-04-11', '2022-04-10', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(1, 2, 250000.00, '2020-03-10', '2023-03-09', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(1, 3, 157000.00, '2020-04-11', '2023-04-10', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(1, 4, 425600.00, '2019-10-11', '2022-10-10', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(1, 5, 155000.00, '2018-01-11', '2022-01-10', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(1, 6, 105000.00, '2019-04-11', '2022-04-10', 1);

insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(2, 7, 235500.00, '2017-06-21', '2022-06-20', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(2, 8, 143000.00, '2019-11-07', '2022-11-06', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(2, 9, 321000.00, '2020-12-23', '2022-12-22', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(2, 10, 350700.00, '2016-10-13', '2022-10-12', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(2, 11, 270000.00, '2020-12-23', '2022-09-22', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(2, 12, 200700.00, '2016-10-13', '2022-10-12', 1);

insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(3, 13, 342600.00, '2019-04-04', '2022-04-03', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(3, 14, 122000.00, '2016-11-27', '2021-11-26', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(3, 15, 144000.00, '2020-02-01', '2021-12-31', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(3, 16, 321000.00, '2015-06-23', '2022-06-22', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(3, 17, 181000.00, '2020-03-12', '2022-09-11', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(3, 18, 138000.00, '2021-02-02', '2022-02-01', 1);

insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(4, 19, 257000.00, '2018-08-04', '2022-02-03', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(4, 20, 398000.00, '2019-06-17', '2026-06-16', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(4, 21, 294000.00, '2021-02-14', '2025-02-13', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(4, 22, 215000.00, '2018-04-03', '2022-04-02', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(4, 23, 235000.00, '2020-04-21', '2023-04-20', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(4, 24, 166000.00, '2021-10-07', '2022-10-06', 1);

insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(5, 25, 150500.00, '2020-11-14', '2022-11-13', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(5, 26, 338000.00, '2013-07-27', '2022-07-26', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(5, 27, 278000.00, '2020-05-22', '2025-05-21', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(5, 28, 207700.00, '2019-05-14', '2024-05-13', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(5, 29, 390000.00, '2020-09-23', '2023-09-22', 1);
insert into NBA_Project.Contract(mg_id,p_id,wage,start_date,end_date,is_active) values(5, 30, 117700.00, '2019-05-29', '2022-11-28', 1);


-- Fantasy_team_create
-- CALL `NBA_Project`.`create_fantasy_team`(3, 'ShubhangiTeam', 17, 24, 1, 7, 22, 23);
-- CALL `NBA_Project`.`create_fantasy_team`(4, 'PTeam', 19, 5, 7, 17, 9, 10);

SET SQL_SAFE_UPDATES = 0;

-- Stats
-- Match1
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (1, 1, 19, 11, 5, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (2, 1, 20, 8, 13, 5);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (3, 1, 18, 9, 4, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (4, 1, 21, 9, 9, 3);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (5, 1, 19, 9, 2, 0);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (6, 1, 19, 9, 6, 2);

insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (7, 1, 20, 9, 4, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (8, 1, 22, 9, 10, 3);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (9, 1, 19, 9, 7, 2);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (10, 1, 16, 9, 4, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (11, 1, 19, 11, 5, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (12, 1, 20, 8, 13, 5);

-- Match2
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (13, 2, 10, 1, 2, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (14, 2, 13, 9, 13, 4);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (15, 2, 21, 9, 3, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (16, 2, 15, 9, 3, 3);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (17, 2, 10, 9, 3, 2);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (18, 2, 9, 6, 6, 0);

insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (19, 2, 9, 8, 7, 5);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (20, 2, 21, 19, 8, 2);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (21, 2, 19, 10, 7, 4);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (22, 2, 14, 2, 4, 0);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (23, 2, 20, 8, 3, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (24, 2, 4, 4, 3, 2);

-- Match3
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (1, 3, 9, 1, 5, 2);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (2, 3, 10, 7, 9, 4);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (3, 3, 15, 9, 3, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (4, 3, 11, 9, 4, 3);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (5, 3, 20, 15, 4, 0);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (6, 3, 2, 1, 1, 1);

insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (19, 3, 19, 8, 7, 4);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (20, 3, 12, 8, 4, 3);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (21, 3, 20, 15, 6, 5);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (22, 3, 13, 12, 1, 0);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (23, 3, 18, 8, 2, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (24, 3, 3, 3, 1, 1);

-- Match4
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (7, 4, 9, 1, 5, 2);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (8, 4, 10, 7, 9, 4);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (9, 4, 15, 9, 3, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (10, 4, 11, 9, 4, 3);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (11, 4, 20, 15, 4, 0);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (12, 4, 2, 1, 1, 1);

insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (25, 4, 19, 8, 7, 4);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (26, 4, 12, 8, 4, 3);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (27, 4, 20, 15, 6, 5);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (28, 4, 13, 12, 1, 0);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (29, 4, 18, 8, 2, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (30, 4, 3, 3, 1, 1);

-- Match5
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (13, 5, 11, 4, 5, 2);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (14, 5, 15, 9, 6, 4);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (15, 5, 10, 9, 1, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (16, 5, 14, 4, 3, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (17, 5, 20, 7, 8, 2);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (18, 5, 19, 16, 3, 2);

insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (25, 5, 10, 2, 7, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (26, 5, 8, 1, 3, 0);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (27, 5, 21, 10, 6, 2);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (28, 5, 10, 4, 2, 1);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (29, 5, 11, 6, 1, 0);
insert into NBA_Project.Stats (p_id, m_id, FGA, FGM, `3PA`, `3PM`) values (30, 5, 4, 3, 0, 0);


-- Message
-- insert into NBA_Project.Message values (3, '2020-02-21 20:30:00', 'Big weekend in progress as my favourite team is playing');
-- insert into NBA_Project.Message values (4, '2020-03-11 21:50:40', 'Had a great birthday as my team won!');