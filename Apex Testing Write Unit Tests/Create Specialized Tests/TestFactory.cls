@IsTest
public class TestFactory {
    public static Account getAccount(String name, Boolean doInsert) {
        Account acct = new Account(name = name);
        if(doInsert) {
            insert acct;
        }
        return acct;
    }
    
    public static Contact getContact(
        Id accountId,
        String firstName,
        String lastName,
        Boolean doInsert
    ) {
        Contact con = new Contact(firstName = firstName, lastName = lastName, accountId = accountId);
        if(doInsert) {
            insert con;
        }
        return con;
    }
    
    public static void generateAccountWithContacts(Integer numContacts) {
        Account acct = getAccount('default account ltd', true);
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < numContacts; i++) {
            String contactName = 'Contact ' + i;
            contacts.add(getContact(acct.id, contactName, contactName, false));
        }
        insert contacts;
    }
    
    public static Opportunity[] generateOppsForAccount(
        Id accountId,
        Decimal amount,
        Integer numOpps
    ) {
        List<Opportunity> opps = new List<Opportunity>();
        for(Integer i = 0; i < numOpps; i++) {
            Opportunity opp = new Opportunity();
            opp.name = 'Account ' + i;
            opp.accountId = accountId;
            opp.amount = amount;
            opp.closeDate = Date.today().addDays(5);
            opp.stageName = 'Prospecting';
            opps.add(opp);
        }
        return opps;
    }
    
    public static Account[] generateAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        List<Account> accts = new List<Account>();
        for(Integer i=0;i<numAccts;i++) {
            Account acct = getAccount('TestAccount' + i, false);
            accts.add(acct);
        }
        insert accts;
        // For each account just inserted, add opportunities
        List<Opportunity> allOpps = new List<Opportunity>();
        for(Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            List<Opportunity> opps = generateOppsForAccount(acct.id, 1000.00, numOppsPerAcct);
            allOpps.addAll(opps);
        }
        // Insert all opportunities for all accounts.
        insert allOpps;
        return accts;
    }
    
    public static User generateUser(String profileName) {
        User userTest = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = :profileName].Id,
            LastName = 'Last',
            Email = 'Cpt.Awesome@awesomesauce.com',
            Username = 'Cpt.Awesome.' + DateTime.now().getTime() + '@awesomesauce.com',
            CompanyName = 'Testing Co',
            Title = 'Captain',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US'
        );
        insert userTest;
        return userTest;
    }
}