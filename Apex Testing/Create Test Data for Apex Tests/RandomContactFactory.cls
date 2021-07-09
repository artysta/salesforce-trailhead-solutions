public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer amount, String lastName) {
        List<Contact> contacts = new List<Contact>();
        
        for (Integer i = 0; i < amount; i++) {
            contacts.add(new Contact(FirstName = 'Test ' + i, LastName = lastName));
        }
        
        return contacts;
    }
}