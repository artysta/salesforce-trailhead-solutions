public with sharing class Books4EveryoneHomeController {
    @AuraEnabled
    public static List<Book__c> getBooks() {
        return [SELECT Id, Name, Description__c FROM Book__c];
    }
    
    @AuraEnabled
    public static List<Book__c> getBooksWithoutAuthors(){
        return [SELECT Name
                FROM Book__c
                WHERE Author__c = null];
    }
    
    @AuraEnabled
    public static List<Book__c> getBooksAndAuthor() {
        return [SELECT Name, Description__c, Author__r.Name FROM Book__c];
    }
    
    @AuraEnabled
    public static List<Recommendation__c> getBookRecommendations() {
        return [SELECT Name, Review__c, Rating__c, Book__r.Name, Book__r.Author__r.Name
                FROM Recommendation__c
                WHERE Book__c != null];
    }
}