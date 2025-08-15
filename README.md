# MySQL Stored Procedures – LAB-2

Q1. ListAllSubscribers()
- Purpose: Loops through all subscribers and prints their names using a cursor. 
           [NOTE: printing result in single table (using temporary table)]
- Run => CALL ListAllSubscribers();

Q2. GetWatchHistoryBySubscriber(IN sub_id INT)
- Purpose: Shows all titles and watch times for a given subscriber using subscriber id.  
- Run => CALL GetWatchHistoryBySubscriber(subscriber_id);

Q3. AddSubscriberIfNotExists(IN subName VARCHAR(100))
- Purpose: Adds a subscriber if not already present.  
- Run => CALL AddSubscriberIfNotExists('Vikash Kumar');

Q4. SendWatchTimeReport()
- Purpose: For all subscribers with watch time > 0, calls GetWatchHistoryBySubscriber() 
           stored procedure internally.  
- Run => CALL SendWatchTimeReport();

Q5. SubscriberWatchHistoryReport()
- Purpose: Loops through each subscriber and prints their watch history, calls
           GetWatchHistoryBySubscriber() stoored procedure internally.
- Run => CALL SubscriberWatchHistoryReport();
