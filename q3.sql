
DROP procedure if exists AddSubscriberIfNotExists;
DELIMITER //
CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100)) 
BEGIN
	declare last_sub_id int;
    select max(SubscriberID) into last_sub_id from Subscribers ;
	if((select count(*) name from Subscribers s where s.SubscriberName = subName)=0 )
    then
    insert into Subscribers(SubscriberID,SubscriberName,SubscriptionDate) 
		   values (last_sub_id+1, subName, now());
    else
    select concat("No Insertion: ",subName," is already present.") as NOTE;
    end if;
END //
DELIMITER ;

-- call AddSubscriberIfNotExists("Santosh");
-- select * from Subscribers;