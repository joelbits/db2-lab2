-- 8. agecheck_insert : Trigger : Before INSERT checks that new age of user > 18. On < 18 error should be printed
DROP TRIGGER IF EXISTS agecheck_insert;
DELIMITER //
CREATE TRIGGER agecheck_insert
BEFORE INSERT ON users FOR EACH ROW
BEGIN
    CALL validate_age(NEW.age);
END //
DELIMITER ;

-- 8. agecheck_update : Trigger : Before UPDATE checks that new age of user > 18. On < 18 error should be printed
DROP TRIGGER IF EXISTS agecheck_update;
DELIMITER //
CREATE TRIGGER update_trigger
BEFORE UPDATE ON users FOR EACH ROW
BEGIN
    CALL validate_age(NEW.age);
END //
DELIMITER ;

-- 8. validate_age(age INT) : Stored Procedure : Gets executed from 8. trigger agecheck_insert and agecheck_update
DROP PROCEDURE IF EXISTS validate_age;
DELIMITER //
CREATE PROCEDURE validate_age(IN age INT)
BEGIN
    IF age < 18 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User too young!';
    END IF;
END //
DELIMITER ;