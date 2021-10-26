public class CalloutController {
    // Unique label corresponding to the continuation
    public String requestLabel;
    // Result of callout
    public String result {get;set;}
    public Object startRequest() {
        //this part up here is common to both the callout 
        //and continuations approaches
        String sessionId = UserInfo.getSessionId();
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + sessionID);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        req.setEndpoint('test_endpoint');
        req.setMethod('GET');
        //Here's how it works with a callout
        Http h = new Http();
        HttpResponse res = h.send(req);
        processResponse(res);
        //and that is all. This works fine until the service is too slow and lots of people use it.
        //Here is what it needs to change to
        Continuation con = new Continuation(40);
        con.continuationMethod='handleCallback';
        this.requestLabel = con.addHttpRequest(req);
        return con;
        //that's the difference for continuations.
    }
    //Here is the callback that waits for a response before continuing
    public Object handleCallback() {
        HttpResponse response = Continuation.getResponse(this.requestLabel);
        return processResponse(response);
    }   
    // Callback method is only needed for continuations.
    public Object processResponse(HttpResponse response) {   
        result = response.getBody();
        // Return null to re-render the original Visualforce page
        return null;
    }
}