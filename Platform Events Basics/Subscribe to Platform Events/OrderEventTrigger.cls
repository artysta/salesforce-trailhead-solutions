trigger OrderEventTrigger on Order_Event__e (after insert) {
    List<Task> tasks = new List<Task>();
    
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            Task task = new Task();
            task.Priority = 'Medium';
            task.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            task.OwnerId = event.CreatedById;
            tasks.add(task);
        }
    }
    
    insert tasks;
}