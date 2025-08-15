use Campus;

DROP procedure if exists SendWatchTimeReport;
DELIMITER //
CREATE PROCEDURE SendWatchTimeReport() 
BEGIN
	declare sub_id int;
	DECLARE done INT DEFAULT FALSE;
    declare temp cursor for (select distinct s.SubscriberId from Subscribers s
							left join WatchHistory w ON s.SubscriberID = w.SubscriberID
							where w.WatchTime>0);
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
    close temp;
END //
DELIMITER ;

call SendWatchTimeReport();

-- select * from WatchHistory 