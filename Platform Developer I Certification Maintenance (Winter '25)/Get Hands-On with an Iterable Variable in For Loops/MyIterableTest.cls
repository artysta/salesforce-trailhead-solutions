@IsTest
public class MyIterableTest {
    @IsTest
    static void testIterableForLoop() {
        List<String> strings = new List<String> { 'Hello', 'World' };
            
        MyIterable iterable = new MyIterable(strings);
        
        for (String s : iterable) {
            System.debug(s);
        }
    }
}