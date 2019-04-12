DELIMITER $$

CREATE TRIGGER example_cannot_follow_self
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
          IF NEW.follower_id = NEW.following_id
          THEN
               SIGNAL SQLSTATE '45000' -- 45000 is generic state for sql
                    SET MESSAGE_TEXT = 'Cannot follow yourself, silly';
          END IF;
     END;
$$

DELIMITER ;