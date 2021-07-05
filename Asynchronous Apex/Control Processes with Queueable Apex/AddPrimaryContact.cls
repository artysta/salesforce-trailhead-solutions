public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String billingState;
        
    public AddPrimaryContact(Contact contact, String billingState) {
        this.contact = contact;
        this.billingState = billingState;
    }
    
    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id
                                  FROM Account
                                  WHERE BillingState = :billingState
                                  LIMIT 200];
        
        List<Contact> contacts = new List<Contact>();
        
        for (Account account : accounts) {
            Contact clonedContact = contact.clone();
            clonedContact.AccountId = account.Id;
            contacts.add(clonedCOntact);
        }
        
        insert contacts;
    }
}