@isTest
private class AccountProcessorTest {
	@isTest
    private static void testCountingContacts() {
        Account account = new Account(Name = 'Test Account Name');
        insert account;
        
        Contact contact1 = new Contact(
            FirstName = 'Thomas',
            LastName = 'Shelby',
            AccountId = account.Id
        );
        insert contact1;
        
		Contact contact2 = new Contact(
            FirstName = 'Arthur',
            LastName = 'Shelby',
            AccountId = account.Id
        );
        insert contact2;
        
        List<Id> accountIds = new List<Id>();
        accountIds.add(account.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
    }
}