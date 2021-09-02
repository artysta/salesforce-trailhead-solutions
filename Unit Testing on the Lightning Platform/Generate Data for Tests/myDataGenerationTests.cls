@isTest
private class myDataGenerationTests {
    @testSetup
    static void loadTestDataFromStaticResource() {
        List<sObject> accounts = Test.loadData(Account.SObjectType, 'Mock_Data');
    }
    
    @isTest
    static void testAmountOfAccounts() {
        List<Account> accounts = [SELECT Id FROM Account];
        System.assert(accounts.size() == 15, 'Expected 15 accounts!');
    }
}