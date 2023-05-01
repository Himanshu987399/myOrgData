global class Facebook {    
    @AuraEnabled
    public static void get_App_Token()
    {
        // Set up the request parameters
      /*  Map<String, Object> requestParams = new Map<String, Object>();
        requestParams.put('phone_number', 'whatsapp:919873996198');
        requestParams.put('message', 'HIMANHSHU');
        String clientId = '1172501643367395';
        String clientSecret = 'b4dc53fb6a06437d8a8211270bfd5aaa';
        Http http = new Http();
        HttpRequest  req = new HttpRequest();
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        req.setEndpoint('https://graph.facebook.com/oauth/access_token');
        req.setBody('{"client_id":"' + clientId + '", "client_secret":"' + clientSecret + '", "grant_type":"client_credentials"}');
        //Facebook_client_id__c =''
        //  Facebook__mdt fb = new Facebook__mdt();
        //fb = [select id , Facebook_client_id__c,Facebook_Grant_Type__c,Facebbok_secret_key__c,Facebook_Access_token__c from Facebook__mdt];
        // req.setEndpoint('https://graph.facebook.com/oauth/access_token?client_id=1172501643367395&client_secret=b4dc53fb6a06437d8a8211270bfd5aaa&grant_type=client_credentials');        
        HttpResponse res = http.send(req);
        System.debug('res'+res.getBody());
        String accessToken = '';
        if(res.getStatusCode() == 200){
            Map<String, Object> authResponse = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            accessToken = (String)authResponse.get('access_token');
        }
        system.debug('AccessToken--->'+accessToken);   */
        // Set up the request headers
        
        string endpoint = 'https://graph.facebook.com/v16.0/116430031428825/messages';
        // Send the WhatsApp message request
        String Data = '{"messaging_product": "whatsapp","to": "919873996198","type": "text", "text": { "preview_url": true, "body": "hi himanshuSharma https://cloudanalogycom-2dd-dev-ed.my.site.com/whatsApp/s/" }}';
        HTTPRequest whatsappReq = new HTTPRequest();
        whatsappReq.setEndpoint(endpoint);
        whatsappReq.setMethod('POST');
        whatsappReq.setBody(Data);
        whatsappReq.setHeader('Content-Type', 'application/json');
        whatsappReq.setHeader('Authorization', 'Bearer EAAQqYkZCzkZBMBAAn7BXTaolB6sF2vgiBcFU5YygywD3M1e4eFFbo1hyPFXXrjZBZBGnoZBAhR9YgdtZAnZAyUCygCykA2qdpc9J6aaoowYBmMIAlIcCArsGrJqQn4dapzmpzm03BRZB2l0JxpZBj5Wa70CkPZBshQ1l6kNgkvJDwfD0avzYltSyI6');     
        HTTPResponse whatsappRes = new Http().send(whatsappReq);
        
        // Check the response status code
        // 
        system.debug('whatsappRes.getBody()-->'+whatsappRes.getBody());
        if (whatsappRes.getStatusCode() == 200) {
            System.debug('Message sent successfully!');
        } else {
            System.debug('Error sending message: ' + whatsappRes.getBody());
        }
        
        
        
        
        
        // fb.Facebook_Access_token__c = str;
        //  Facebook_Access_Token__c fbtoken = new Facebook_Access_Token__c();
        //  fbtoken = [select id, Facebook_Access_token__c from Facebook_Access_Token__c];
        //fbtoken.Facebook_Access_token__c = str;
        //update fbtoken;
        
    }
    
    public static void getUserToken(){
        Http http = new Http();
        HttpRequest  req = new HttpRequest();
        // Facebook__mdt fb = new Facebook__mdt();
        // fb = [select id , Facebook_client_id__c,Facebook_Grant_Type__c,Facebbok_secret_key__c,Facebook_Access_token__c from Facebook__mdt];
        //Facebook_Access_Token__c fbtoken = new Facebook_Access_Token__c();
        //btoken = [select id, Facebook_Access_token__c from Facebook_Access_Token__c];
        String body = '{"messaging_product": "whatsapp","recipient_type":"individual","to": "919617880303","type": "text",  "text" :{"preview_url":false,"body" : "Hii Himanshu Sharma"}}';
        req.setEndpoint('https://graph.facebook.com/1172501643367395/accounts?access_token=1172501643367395|Cnb-agn56RVyzxrsrT3FC_SVOA8');
        req.setMethod('GET');
        req.setBody(body);
        HttpResponse res = http.send(req);
        System.debug('re::::'+res.getBody());
        System.debug('re::::'+res.getStatusCode());
        
        
        
        
        
    }
    /* public static void getData(){
Http http = new Http();
HttpRequest  req = new HttpRequest();
Facebook__mdt fb = new Facebook__mdt();
fb = [select id , Facebook_client_id__c,Facebook_Grant_Type__c,Facebbok_secret_key__c,Facebook_Access_token__c from Facebook__mdt];   
Facebook_Access_Token__c fbtoken = new Facebook_Access_Token__c();
fbtoken = [select id, Facebook_Access_token__c from Facebook_Access_Token__c];
System.debug('acess::'+fbtoken.Facebook_Access_token__c);

User_Token__c userToken = new User_Token__c();
userToken = [select id, user_Token__c from User_Token__c];
req.setEndpoint(' https://graph.facebook.com/v14.0/me?fields=id%2Cname%2Cfriends%2Cbirthday%2Cage_range%2Cemail%2Cposts&access_token='+userToken.user_Token__c+'');

req.setMethod('GET');
HttpResponse res = http.send(req);
System.debug('re::::'+res.getBody());
System.debug('re::::'+res.getStatusCode());


}*/
    public class cdfe {
        public List<Data> data;
        public Paging paging;
    }
    
    public class Paging {
        public Cursors cursors;
    }
    
    public class Cursors {
        public String before;
        public String after;
    }
    
    global class Data {
        public String id;
        public String login_url;
        public String access_token;
    }
}