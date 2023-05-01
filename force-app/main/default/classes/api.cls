public class api{
    public static void getAccounts(){
        
        httprequest req = new httprequest();
        http testHttp = new http();
        
        req.setMethod('GET');
        req.setEndPoint('https://ap2.salesforce.com/services/data/v38.0/sobjects/Contact');
        req.setHeader('Authorization','OAuth 00D28000001yTWP!AQwAQMPFnsn66o3QnIG.vRfAwkPm1bBVumQlEB4rK.ywUQFzlfx6bvhLIH5XH18ilDT7CxD9o5Bu_kql4fN4r0J06Wj7N7rv');
        HttpResponse res = testHttp.send(req);
        System.debug(res.getBody());
    }
}