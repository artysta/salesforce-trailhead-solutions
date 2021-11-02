public with sharing class Books4EveryoneHomeController {
    @AuraEnabled
    public static List<Book__c> getBooks() {
        return [SELECT Id, Name, Description__c FROM Book__c];
    }
    
    @AuraEnabled
    public static List<Book__c> getBooksAndAuthor() {
        return [SELECT Name, Description__c, Author__r.Name FROM Book__c];
    }
}