@IsTest
private class OtherCSVTests {
    @TestSetup
    static void loadTestDataFromStaticResource() {
        List<sObject> accounts = Test.loadData(Account.SObjectType, 'otherAccountData');
    }
    
    @IsTest
    static void testLoadOtherAccountsFromStaticResource() {
        Test.startTest();
        List<Account> accounts = [SELECT Id FROM Account];
        Test.stopTest();
        
        Assert.isTrue(accounts.size() == 15, 'There should be exactly 15 records of the Account type.');
    }
}