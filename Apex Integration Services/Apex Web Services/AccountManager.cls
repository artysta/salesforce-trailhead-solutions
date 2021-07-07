@RestResource(urlMapping = '/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account account = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account WHERE Id = :accountId];
        return account;
    }
}