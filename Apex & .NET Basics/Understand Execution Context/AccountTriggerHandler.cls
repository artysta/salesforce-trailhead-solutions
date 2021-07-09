public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accounts) {        
        for (Account account : accounts) {
            if (account.ShippingState != account.BillingState) {
                account.ShippingState = account.BillingState;
            }
        }
    }
}