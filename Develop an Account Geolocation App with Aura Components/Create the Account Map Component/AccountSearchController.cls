public with sharing class AccountSearchController {
    @AuraEnabled
    public static List<Account> searchAccounts(String searchTerm) {
        List<Account> accounts = new List<Account>();
        if (String.isNotBlank(searchTerm) && searchTerm.length() > 1) {
            List<List<SObject>> searchResults = [
                FIND :searchTerm
                RETURNING Account(
                    Id, Name, Phone, Website,
                    BillingStreet, BillingCity,
                    BillingState, BillingPostalCode
                    ORDER BY Name
                    LIMIT 10
                )
            ];
            accounts = searchResults[0];
        }
        return accounts;
    }
}