@isTest
private class AccountTriggerTest {
	@isTest
    private static void testInsertingNewAccounts() {
        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < 200; i++) {
            accounts.add(new Account(Name = 'Test ' + i, BillingState = 'CA'));
        }
        
        Test.startTest();
        insert accounts;
        Test.stopTest();	
        
        List<Account> insertedAccounts = [SELECT Id FROM Account WHERE ShippingState = 'CA'];
        
        System.assertEquals(200, insertedAccounts.size());
    }
}