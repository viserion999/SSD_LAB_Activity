
DROP procedure if exists SendWatchTimeReportForAll;
DELIMITER //
CREATE PROCEDURE SendWatchTimeReportForAll() 
BEGIN
	declare sub_id int;
	DECLARE done INT DEFAULT FALSE;
    declare temp cursor for (select distinct s.SubscriberId from Subscribers s);
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	drop temporary table if exists temp_table ;
	create temporary table temp_table(Show_Title varchar(100), Watched_Time time);
	open temp;
		 loop_k : loop
			fetch temp into sub_id;
            IF done THEN
				LEAVE loop_k;
			END IF;
			call GetWatchHistoryBySubscriber (sub_id);
        end loop loop_k;
        drop temporary table if exists temp_table ;
    close temp;
END //
DELIMITER ;

-- CALL SendWatchTimeReportForAll();