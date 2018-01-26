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