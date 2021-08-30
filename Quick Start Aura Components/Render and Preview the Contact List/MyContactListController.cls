public class MyContactListController {
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId) {
        return [SELECT Id, FirstName, LastName, Email, Phone
                FROM Contact
                WHERE AccountId = :recordId];
    }
}