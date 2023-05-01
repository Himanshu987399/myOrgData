public class integration {
    public static void check002(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:connectorg2/drive/v3/files');
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        system.debug('responsecode--->'+response.getStatusCode());
        if(response.getStatusCode()==200){
            System.debug('response--->'+response.getbody());
        } 
    }
}