----------------------------------------------------------------------------------

-------- Trigger
CREATE TRIGGER `mail` BEFORE INSERT ON `artgallery`.`email` FOR EACH ROW

BEGIN
    IF NOT(SELECT NEW.email_id REGEXP '$[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$') THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT =  "INCORRECT email" ; 
            INSERT INTO email(email_id) VALUES(email_id); 
    END IF;
END; $$


DELIMITER ;


--------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE validate_customer(
	IN age INT,
	IN email VARCHAR(128)
)
DETERMINISTIC
NO SQL
BEGIN
	IF age < 18 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Age must be gte 18';
	END IF;
	IF NOT (SELECT email REGEXP '$[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$') THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Wrong email';
	END IF;
END$$
DELIMITER ;
--------------------------------------------------------------------------------------


---- Procedure


CREATE PROCEDURE newproc(IN Email varchar(50), IN Feedback varchar(400))
BEGIN

UPDATE email SET feedback=Feedback WHERE email_id=Email;

END; $$