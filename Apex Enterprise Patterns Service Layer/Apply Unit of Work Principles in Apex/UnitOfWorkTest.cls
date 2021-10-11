@isTest
private class UnitOfWorkTest {
    @testSetup
    static void setupData() {
        Test.startTest();

        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );
        
        for (Integer i = 0; i < 100; i++) {
            Account newAccount = new Account();
            newAccount.Name = 'Account Test Name ' + i;
            uow.registerNew(newAccount);
        }
        
        for (Integer i = 0; i < 500; i++) {
            Contact newContact = new Contact();
            newContact.LastName = 'Test Last Name ' + i;
            uow.registerNew(newContact);
            
            Note newNote = new Note();
            newNote.Title = 'Test Title ' + i;
            uow.registerNew(newNote, Note.ParentId, newContact);
        }
        
        uow.commitWork();
        
        Test.stopTest();
    }
    
    @isTest
    static void challengeComplete() {
        Test.startTest();
        
        System.assertEquals(100, [SELECT Id FROM Account].size());
        System.assertEquals(500, [SELECT Id FROM Contact].size());
        System.assertEquals(500, [SELECT Id FROM Note].size());
        
        Test.stopTest();
    }
}