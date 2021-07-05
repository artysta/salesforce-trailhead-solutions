@isTest
private class AddPrimaryContactTest {
    @isTest
    public static void testAddingContacts() {
        List<Account> accounts = new List<Account>();
        
        for (Integer i = 0; i < 200; i++) {
			accounts.add(
                new Account(
                    Name = 'Test Account Name ' + i,
                    BillingState = 'NY'
                )
            );
            
            accounts.add(
                new Account(
                    Name = 'Test Account Name ' + i,
                    BillingState = 'CA'
                )
            );
        }
        
        insert accounts;
        
        Contact contact = new Contact(FirstName = 'James', LastName = 'Ford');
        
        insert contact;
        
        Test.startTest();
        System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();
        
        List<Contact> contacts = [SELECT Id
                                  FROM Contact
                                  WHERE Contact.Account.BillingState = 'CA'];
        
        System.assertEquals(200, contacts.size(), 'Something went wrong! Incorrect number of contacts!');
    }
}