@isTest
private class AnimalLocatorTest{
    @isTest private static void shouldSuccessfullyCheckAnimalName() {
        Test.setMock(HttpCallOutMock.class, new AnimalLocatorMock());
        
        String name = AnimalLocator.getAnimalNameById(2);
        String expectedName = 'bear';
        
        System.assertEquals(name, expectedName);
    }
}
