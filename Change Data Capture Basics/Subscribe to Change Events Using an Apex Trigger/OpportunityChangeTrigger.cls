trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
    List<Task> tasks = new List<Task>();
    
    for (OpportunityChangeEvent event : Trigger.New) {
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;
        
        System.debug('Received change event for ' +
                     header.entityName + ' for the ' +
                     header.changeType + ' operation.');
        
        if (header.changetype == 'UPDATE' && event.isWon == true) {
            Task task = new Task();
            task.Subject = 'Follow up on won opportunities: ' + header.recordIds;
            task.OwnerId = header.CommitUser;
            tasks.add(task);
        }
        
        if (tasks.size() > 0) {
            insert tasks;
        }
    }
}