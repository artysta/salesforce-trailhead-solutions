trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();
    
    for (Opportunity opportunity : Trigger.New) {
        if (opportunity.StageName == 'Closed Won') {
            tasks.add(new Task(Subject = 'Follow Up Test Task', WhatId = opportunity.Id));
        }
    }
    
    if (tasks.size() > 0) {
        insert tasks;
    }
}