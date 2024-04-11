@isTest
private class CalculatorTests {
    @isTest
    static void testDivideByZero() {                
        try {
            Test.startTest();
            Decimal result = Calculator.divide(6, 0);
            Test.stopTest();
            
            Assert.fail('An exception should have been thrown');
        } catch (Calculator.CalculatorException e) {
            Assert.isTrue(e.getMessage().equalsIgnoreCase('You still can\'t divide by zero'), 'Exception message does not match: ' + e.getMessage());
        }
    }
}