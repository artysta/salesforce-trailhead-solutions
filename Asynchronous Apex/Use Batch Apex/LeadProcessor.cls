public class LeadProcessor implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext context) {
        return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
    }
    
    public void execute(Database.BatchableContext context, List<Lead> leads) {
        for (Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }
        
        update leads;
    }
    
    public void finish(Database.BatchableContext context) {
        System.debug('Job done!');
    }
}