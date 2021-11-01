public with sharing class Books4EveryoneHomeController {
    @AuraEnabled
    public static List<Book__c> getBooks() {
        return [SELECT Id, Name, Description__c FROM Book__c];
    }
}