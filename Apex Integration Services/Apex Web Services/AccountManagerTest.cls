@isTest
private class AccountManagerTest {
	@isTest
    private static void testGetContactsByAccountId() {
        Id accountId = createTestAccount();
        
        RestRequest request = new RestRequest();
        request.requestUri = 'https://yourInstance.salesforce.com/services/apexrest/Accounts/' + accountId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account account = AccountManager.getAccount();
        
        System.assert(account != null);
        System.assertEquals('Account Test Name', account.Name);
    }
    
    private static Id createTestAccount() {
        Account account = new Account(Name = 'Account Test Name');
        insert account;
        
        Contact contact = new Contact(FirstName = 'Gregory', LastName = 'House', AccountId = account.Id);
        insert contact;
        
        return account.Id;
    }
}