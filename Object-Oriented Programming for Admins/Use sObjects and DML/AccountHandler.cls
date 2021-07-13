public class AccountHandler {
    public static void insertAccount(Integer amount) {
        List<Account> addAccounts = new List<Account>();
        
        for (Integer i = 0; i < amount; i++) {
            addAccounts.add(new Account(Name = 'Acme Inc ' + i, AccountNumber = 'A000' + i));
        }
        
        insert addAccounts;
    }
}