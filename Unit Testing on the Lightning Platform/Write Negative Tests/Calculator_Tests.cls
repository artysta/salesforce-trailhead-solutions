@isTest
private class Calculator_Tests {
    @isTest
    static void testPositiveAddition() {
        System.assertEquals(5, Calculator.addition(2, 3));
    }
    
    @isTest
    static void testNegativeAddition() {
        System.assertNotEquals(10, Calculator.addition(2, 3));
    }
    
    @isTest
    static void testPositiveSubtraction() {
        System.assertEquals(7, Calculator.subtraction(10, 3));
    }
    
    @isTest
    static void testNegativeSubtraction() {
        System.assertNotEquals(5, Calculator.subtraction(10, 3));
    }
    
    @isTest
    static void testPositiveMultiply() {
        System.assertEquals(9, Calculator.multiply(3, 3));
    }
    
    @isTest
    static void testNegativeMultiply() {
        System.assertNotEquals(12, Calculator.multiply(3, 3));
    }
    
    @isTest
    static void testPositiveDivide() {
        System.assertEquals(5, Calculator.divide(10, 2));
    }
    
    @isTest
    static void testNegativeDivide() {
        System.assertNotEquals(8, Calculator.divide(10, 2));
    }
    
    @isTest
    static void testNegativeMultiplyByZero() {
        Test.startTest();
        List<Boolean> exceptions = new List<Boolean>();

        try {
            Calculator.multiply(10, 0);
        } catch (Calculator.CalculatorException calculatorException) {
            if (calculatorException.getMessage().equalsIgnoreCase('It doesn\'t make sense to multiply by zero')) {
                exceptions.add(true);
            }
        }

        Test.stopTest();
        
        System.assertNotEquals(0, exceptions.size(), 'Expected at least one exception to have occured');
        
        for (Boolean e : exceptions) {
            System.assert(e, 'Calculation should have thrown an exception');
        }
    }
    
    @isTest
    static void testNegativeDivideByZero() {
        Test.startTest();
        List<Boolean> exceptions = new List<Boolean>();
        
        try {
            Calculator.divide(10, 0);
        } catch (Calculator.CalculatorException calculatorException) {
            if (calculatorException.getMessage().equalsIgnoreCase('you still can\'t divide by zero')) {
                exceptions.add(true);
            }
        }
        
        Test.stopTest();
        
        System.assertNotEquals(0, exceptions.size(), 'Expected at least one exception to have occured');
        
        for (Boolean e : exceptions) {
            System.assert(e, 'Calculation should have thrown an exception');
        }
    }
    
    @isTest
    static void testNegativeDivideResultLessThanZero() {
        Test.startTest();
        List<Boolean> exceptions = new List<Boolean>();
        
        try {
            Calculator.divide(10, -2);
        } catch (Calculator.CalculatorException calculatorException) {
            if (calculatorException.getMessage().equalsIgnoreCase('Division returned a negative value.-5')) {
                exceptions.add(true);
            }
        }
        
        Test.stopTest();
        
        System.assertNotEquals(0, exceptions.size(), 'Expected at least one exception to have occured');
        
        for (Boolean e : exceptions) {
            System.assert(e, 'Calculation should have thrown an exception');
        }
    }
}