@isTest
private class ExternalSearch_Tests {
    @isTest
    static void test200StatusCode() {
        HttpMockFactory mock = new HttpMockFactory(200, 'OK', 'I found it!', new Map<String,String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        Test.startTest();
        result = ExternalSearch.googleIt('epic search');
        Test.stopTest();
        System.assertEquals('I found it!', result);
    }
    
    @isTest
    static void test500StatusCode() {
        HttpMockFactory mock = new HttpMockFactory(500, 'Internal Server Error', 'Didn\'t found it!', new Map<String, String>());
        Test.setMock(HttpCalloutMock.class, mock);
        String result;
        List<Boolean> exceptions = new List<Boolean>();
        Test.startTest();
        
        try{
            result = ExternalSearch.googleIt('epic search');
        } catch (ExternalSearch.ExternalSearchException externalSearchException){
            if (externalSearchException.getMessage().equalsIgnoreCase('Did not recieve a 200 status code: ' + 500)){
                exceptions.add(true);
            }
        }
        
        Test.stopTest();
        
        System.assert(exceptions.size() > 0, 'Expected at least one exception to have occured');
        
        for(Boolean b : exceptions){
            System.assert(b, 'Callout should have thrown an exception');
        }
    }
}