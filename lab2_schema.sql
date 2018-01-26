create table users (
  id int primary key auto_increment,
  username varchar(16) unique not null,
  pass varchar(255),
  email varchar(255) unique not null,
  fname varchar(32),
  lname varchar(32),
  age INT not null
);
 
create table friends (
  u_id int,
  f_id int,
  foreign key (u_id) references users(id),
  foreign key (f_id) references users(id)
);

create table hobbies (
  id int primary key auto_increment,
  name varchar(32) unique
);

create table usershobbies (
  u_id int,
  h_id int,
  foreign key (u_id) references users(id),
  foreign key (h_id) references hobbies(id)
);

insert into users (username, pass, email, fname, lname, age) values ('cbouldon', 'XPlgTwYDBD', 'cbouldon0@instagram.com', 'Christoforo', 'Bouldon','33');
insert into users (username, pass, email, fname, lname, age) values ('eharbach', 'ojPgMdpezTDr', 'eharbach1@nature.com', 'Eb', 'Harbach','23');
insert into users (username, pass, email, fname, lname, age) values ('zcampelli', 'sy3NCbR', 'zcampelli2@constantcontact.com', 'Zea', 'Campelli','97');
insert into users (username, pass, email, fname, lname, age) values ('ewigfield', 'VkDvqBIeq', 'ewigfield3@netlog.com', 'Elwira', 'Wigfield', '18');
insert into users (username, pass, email, fname, lname, age) values ('cdrysdale', 'jlEpzx5PY3A', 'cdrysdale4@amazon.com', 'Carlye', 'Drysdale', '54');
insert into users (username, pass, email, fname, lname, age) values ('mniesing', 'GezN4CzXkjI', 'mniesing5@telegraph.co.uk', 'Marita', 'Niesing', '22');
insert into users (username, pass, email, fname, lname, age) values ('tthake', 'Rk3eHqoNmwp', 'tthake6@liveinternet.ru', 'Thedrick', 'Thake', '63');
insert into users (username, pass, email, fname, lname, age) values ('lwrenn', '7WXuwZDL', 'lwrenn7@arizona.edu', 'Lisha', 'Wrenn', '41');
insert into users (username, pass, email, fname, lname, age) values ('jbahde', 'q2IQurXi5QN', 'jbahde8@goodreads.com', 'Josee', 'Bahde', '30');
insert into users (username, pass, email, fname, lname, age) values ('cwalsham', 'iBkH8SHi6oH', 'cwalsham9@usda.gov', 'Carroll', 'Walsham', '77');

insert into hobbies (name) values ('Programming');
insert into hobbies (name) values ('Pilates');
insert into hobbies (name) values ('Coffe');
insert into hobbies (name) values ('Surfing');
insert into hobbies (name) values ('Gardening');

insert into friends (u_id, f_id) values (1, 2), (2, 1);
insert into friends (u_id, f_id) values (1, 3), (3, 1);
insert into friends (u_id, f_id) values (2, 3), (3, 2);
insert into friends (u_id, f_id) values (2, 4), (4, 2);
insert into friends (u_id, f_id) values (2, 5), (5, 2);
insert into friends (u_id, f_id) values (3, 5), (5, 3);
insert into friends (u_id, f_id) values (3, 9), (9, 3);
insert into friends (u_id, f_id) values (4, 5), (5, 4);
insert into friends (u_id, f_id) values (4, 10), (10, 4);
insert into friends (u_id, f_id) values (5, 6), (6, 5);
insert into friends (u_id, f_id) values (5, 7), (7, 5);
insert into friends (u_id, f_id) values (5, 8), (8, 5);
insert into friends (u_id, f_id) values (6, 7), (7, 6);
insert into friends (u_id, f_id) values (6, 8), (8, 6);
insert into friends (u_id, f_id) values (7, 8), (8, 7);
insert into friends (u_id, f_id) values (7, 9), (9, 7);
insert into friends (u_id, f_id) values (8, 9), (9, 8);
insert into friends (u_id, f_id) values (9, 10), (10, 9);
insert into friends (u_id, f_id) values (10, 1), (1, 10);
insert into friends (u_id, f_id) values (10, 2), (2, 10);
 
insert into usershobbies (u_id, h_id) values (1, 1), (1, 2), (1, 4);
insert into usershobbies (u_id, h_id) values (2, 1), (2, 2), (2, 5);
insert into usershobbies (u_id, h_id) values (3, 1), (3, 2), (3, 4);
insert into usershobbies (u_id, h_id) values (4, 1), (4, 2), (4, 5);
insert into usershobbies (u_id, h_id) values (5, 1), (5, 2), (5, 4);
insert into usershobbies (u_id, h_id) values (6, 1), (6, 3), (6, 5);
insert into usershobbies (u_id, h_id) values (7, 1), (7, 3), (7, 4);
insert into usershobbies (u_id, h_id) values (8, 1), (8, 3), (8, 5);
insert into usershobbies (u_id, h_id) values (9, 1), (9, 3), (9, 4);
insert into usershobbies (u_id, h_id) values (10, 1), (10, 3), (10, 5);

-- 1. all_users : View : Returns one col for username and one with number_of_friends where number of friends is calculated
CREATE VIEW all_users AS
SELECT u.username, 
  (SELECT COUNT(*) FROM friends WHERE u_id = u.id) as 'number_of_friends'
FROM users u;

-- 2. friends_list : View : 
CREATE VIEW friends_list AS
SELECT u.username as username,
  (
    SELECT CONCAT(fname, ' ', lname) 
    FROM users 
    WHERE id = f.u_id
  ) as 'friendname'
FROM users u
JOIN friends f
ON u.id = f.f_id;

-- 3. user_email : Procedure : call user_email(); should give a list with email, fnamn and lnamn for all users in db.
-- Code in lab2_procedures.sql

-- 4. add_hobby(hobby) : Stored Procedure : Adds a hobby to the hobbies table
-- Code in lab2_procedures.sql

-- 5. add_user(username, pass, fname, lname, email, age) : Stored Procedure : 
-- Code in lab2_procedures.sql