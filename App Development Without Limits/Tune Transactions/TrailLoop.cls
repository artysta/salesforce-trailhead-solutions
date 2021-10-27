public class TrailLoop {
    //Here is a combined problem of a query that needs a filter
    //and a loop that continually calls out to the database
    public static void AllGoodThings(Account a) {
        List<Task> allMyTasks = [SELECT Id, Status, whatId FROM Task WHERE whatId = :a.Id];
        
        for (Task t : allMyTasks) {
            if (t.whatId == a.id) {
                t.status = 'Completed';
            }
        }
        
        update allMyTasks;
    }
}