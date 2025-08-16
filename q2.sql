-- use Campus;

DROP procedure if exists GetWatchHistoryBySubscriber;
DELIMITER //
CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT) 
BEGIN
    select sw.Title as Show_Watched, w.WatchTime AS Watch_Time from WatchHistory w 
            left Join Shows sw ON sw.ShowID = w.ShowID
            where w.SubscriberID = sub_id;
END //
DELIMITER ;

-- call GetWatchHistoryBySubscriber(2);