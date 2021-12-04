global with sharing class ZBSDataLoadController {
    @RemoteAction
    global static void deleteAll() {
        // DELETE [SELECT ID FROM Account WHERE CreatedDate >= THIS_WEEK];    
        // DELETE [SELECT ID FROM property__c];    
        // DELETE [SELECT ID FROM broker__c];
        // DELETE [SELECT ID FROM bot_command__c];
    }
}