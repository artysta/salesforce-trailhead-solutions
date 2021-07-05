public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
        List<Account> accountsToUpdate = new List<Account>();

        List<Account> accounts = [SELECT Id, Name, (SELECT Id from Contacts)
                                  FROM Account
                                  WHERE Id IN :accountIds];
        
        for (Account account : accounts) {
            List<Contact> contacts = account.Contacts;
            account.Number_of_Contacts__c = contacts.size();
            accountsToUpdate.add(account);
        }
        
        update accountsToUpdate;
    }
}