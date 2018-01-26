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
