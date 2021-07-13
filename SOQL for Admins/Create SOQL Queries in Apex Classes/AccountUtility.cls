public class AccountUtility {
    public static void viewAnnualRevenue() {
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];
        
        for (Account account : accountsList) {
            String acctRev = account.Name + ' : ' + account.AnnualRevenue;
            System.debug(acctRev);
        }
    }
}