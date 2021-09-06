public class ExternalSearch {
    public class ExternalSearchException extends Exception{}
    
    public static string googleIt(String query){
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.google.com?q='+query);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        if(res.getStatusCode() != 200){
            throw new ExternalSearchException('Did not recieve a 200 status code: ' + res.getStatusCode());
        }
        return res.getBody();
    }
    
}