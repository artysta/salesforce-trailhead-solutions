@isTest
private class TestRestrictContactByName {
    @isTest
    private static void testCreatingContactWithInvalidName() {
        Contact contact = new Contact(FirstName = 'Adrian', LastName = 'INVALIDNAME');
        
        Test.startTest();
        Database.SaveResult result = Database.insert(contact, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());        
    }
}