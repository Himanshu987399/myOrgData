public class searchPropertyApex {
    @AuraEnabled
    public static List<Property__c> getProperty(String country,String state){
        return [select id,Name,Owner_Name__c,Phone_No__c,Address__c from Property__c where Country__c =:country And State__c =:state];
    }
    public static void getWheather(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.google.com/search?q=request+in+apex&oq=requestin+ap&aqs=chrome.6.69i57j0i13i512l4j0i10i13i512j0i22i30l2j0i15i22i30l2.5812j1j7&sourceid=chrome&ie=UTF-8');
        req.setMethod('GET');

        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
    } 
}