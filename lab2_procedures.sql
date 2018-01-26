-- 3. user_email : Procedure : call user_email(); should give a list with email, fnamn and lnamn for all users in db.
DROP PROCEDURE IF EXISTS user_email;
DELIMITER //
CREATE PROCEDURE user_email()
BEGIN
SELECT u.email, u.fname, u.lname  
FROM users u;
END //
DELIMITER ;

-- 4. add_hobby(hobby) : Adds a hobby to the hobbies table
DROP PROCEDURE IF EXISTS add_hobby;
DELIMITER //
CREATE PROCEDURE add_hobby(hobby VARCHAR(30))
BEGIN
INSERT INTO hobbies (name)
VALUES (hobby);
END //
DELIMITER ;

-- 5. add_user(username, pass, fname, lname, email, age) : Adds a user to users table. Also add Hobby 'Programmering' for that user.
DROP PROCEDURE IF EXISTS add_user;
DELIMITER //
CREATE PROCEDURE add_user(
    username VARCHAR(25),
    pass VARCHAR(25),
    fname VARCHAR(25),
    lname VARCHAR(25),
    email VARCHAR(40),
    age INT
)
BEGIN
INSERT INTO users (username, pass, email, fname, lname, age)
VALUES (username, pass, fname, lname, email, age);
INSERT INTO usershobbies (u_id, h_id)
VALUES (LAST_INSERT_ID(), 1);
END //
DELIMITER ;

-- 6. deleteUser(id) : Procedure : Removes a user from users, specified by user.id
DROP PROCEDURE IF EXISTS deleteUser;
DELIMITER //
CREATE PROCEDURE deleteUser(iid INT)
BEGIN
SET FOREIGN_KEY_CHECKS=0; -- to disable foreign key checks
DELETE
FROM friends
WHERE u_id = iid;

DELETE
FROM usershobbies
WHERE u_id = iid;

DELETE  
FROM users
WHERE id = iid;

SET FOREIGN_KEY_CHECKS=1; -- re-enable foreign key checks
END //
DELIMITER ;

-- 7. add_friendship(id_a, id_b) : Procedure : takes two user id and stores (id_a, id_b) and (id_b, id_a) in the friends table. Must exist 2 posts for correlation to work.
DROP PROCEDURE IF EXISTS add_friendship;
DELIMITER //
CREATE PROCEDURE add_friendship(id_a INT, id_b INT)
BEGIN
INSERT INTO friends (u_id, f_id)
VALUES (id_a, id_b);
INSERT INTO friends (u_id, f_id)
VALUES (id_b, id_a);
END //
DELIMITER ;