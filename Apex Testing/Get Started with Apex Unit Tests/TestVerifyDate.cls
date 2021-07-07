@isTest
private class TestVerifyDate {
    @isTest
    private static void testDateWithin30Days() {
        Date date1 = Date.valueOf('2021-07-07');
        Date date2 = Date.valueOf('2021-07-15');
        Date result = VerifyDate.CheckDates(date1, date2);
        
        System.assertEquals(date2, result);
    }
    
    @isTest
    private static void testDateNotWithin30Days() {
        Date date1 = Date.valueOf('2021-07-07');
        Date date2 = Date.valueOf('2021-08-30');
        Date result = VerifyDate.CheckDates(date1, date2);

        System.assertEquals(result, Date.valueOf('2021-07-31'));
    }
}