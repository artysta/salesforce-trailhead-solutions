public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String name) {
        return [FIND :name IN NAME FIELDS RETURNING Contact(Name), Lead(Name)];
    }
}