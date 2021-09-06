@isTest
public class HTTPMockFactory implements HttpCalloutMock {
    protected Integer code;
    protected String status;
    protected String body;
    protected Map<String, String> responseHeaders;
    
    public HTTPMockFactory(Integer code, String status, String body, Map<String, String> responseHeaders) {
        this.code = code;
        this.status = status;
        this.body = body;
        this.responseHeaders = responseHeaders;
    }
    
    public HTTPResponse respond(HTTPRequest request) {
        HttpResponse resposne = new HttpResponse();
        
        for (String key : this.responseHeaders.keySet()) {
            resposne.setHeader(key, this.responseHeaders.get(key));
        }
        
        resposne.setBody(this.body);
        resposne.setStatusCode(this.code);
        resposne.setStatus(this.status);
        
        return resposne;
    }
}