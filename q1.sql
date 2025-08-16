
DROP procedure if exists ListAllSubscribers;
DELIMITER //
CREATE PROCEDURE ListAllSubscribers() 
BEGIN
    DECLARE done INT DEFAULT FALSE;
    declare subs_name varchar(100);
    declare temp cursor for select SubscriberName from Subscribers;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    drop temporary table if exists temp_table;
    create temporary table temp_table (subscriber_name varchar(100));

    open temp;
		 loop_k : loop
			fetch temp into subs_name;
            IF done THEN
				LEAVE loop_k;
			END IF;
            insert into temp_table values (subs_name);
        end loop loop_k;
    close temp;

    select * from temp_table;
    drop temporary table if exists temp_table;
END //
DELIMITER ;

-- call ListAllSubscribers ();