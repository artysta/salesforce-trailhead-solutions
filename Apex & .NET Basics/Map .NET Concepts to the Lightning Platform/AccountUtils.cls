public class AccountUtils {
    public static List<Account> accountsByState(String billingState) {
        return [SELECT Id, Name FROM Account WHERE BillingState = :billingState];
    }
}