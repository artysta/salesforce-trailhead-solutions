@isTest
private class ParkLocatorTest {
    @isTest
    private static void testParkLocator() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String[] parks = ParkLocator.country('India');
        System.assertEquals('Park_1', parks[0]);
    }
}