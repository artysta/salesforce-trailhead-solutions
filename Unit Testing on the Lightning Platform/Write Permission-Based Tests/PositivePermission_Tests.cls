@isTest
private class PositivePermission_Tests {
    @testSetup
    static void testSetup(){
        Account account = TestFactory.getAccount();
        Private_Object__c privateObject = new Private_Object__c(Account__c = account.Id, Notes__c = 'foo');
        Test.startTest();
        insert privateObject;
        Test.stopTest();
    }
    
    @isTest
    static void PermissionSetTest_Positive() {
        User user = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Custom User'].Id,
            LastName = 'Last Name',
            Email = 'Cpt.Awesome@awesomesauce.com',
            UserName = 'Cpt.Awesome.' + DateTime.now().getTime() + '@awesomesauce.com',
            Alias = 'Alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US'
        );
        
        System.runAs(user){
            Test.startTest();
            List<Private_Object__c> privateObjects = [SELECT Id, Account__c, Notes__c FROM Private_Object__c];
            Test.stopTest();
            System.assert(privateObjects.size() > 0, 'Expected at least 1 record.');
        }
    }
}