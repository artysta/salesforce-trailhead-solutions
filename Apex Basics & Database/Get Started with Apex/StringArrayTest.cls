public class StringArrayTest {
    public static List<String> generateStringArray(Integer numberOfStrings) {
        List<String> listOfStrings = new List<String>();
        
        for (Integer i = 0; i < numberOfStrings; i++) {
            listOfStrings.add('Test ' + i);
        }
        
        return listOfStrings;
    }
}