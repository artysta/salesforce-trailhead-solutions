public class AccountHandler {
    public static Account insertNewAccount(String name) {
        try {
            Account account = new Account(Name = name);
            insert account;
            return account;
        } catch (DmlException e) {
            return null;
        }
    }
}