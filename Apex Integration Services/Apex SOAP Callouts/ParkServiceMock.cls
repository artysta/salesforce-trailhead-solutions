@isTest
public class ParkServiceMock implements WebServiceMock {
    public void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
               
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        List<String> parks = new List<String> { 'Park_1', 'Park_2' };

        response_x.return_x = parks;
        response.put('response_x', response_x);
    }
}
