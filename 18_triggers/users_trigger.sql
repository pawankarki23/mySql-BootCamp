-- run a code before an item is inserted into the a table
DELIMITER $$ -- changing the delimeter to $$ for now so that sql does not stop and execute as soon as it finds ;

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ; -- change back to ;