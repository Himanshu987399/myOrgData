@RestResource(urlMapping='/whatsapp/webhooks/v1/*')
global class WhatsAppWebhook {
	private static Final String SIGNATURE_VALID_MESSAGE = 'Signature Verified';
    private static Final String SIGNATURE_NOT_VALID_MESSAGE = 'Signature could not be verified';
    
    @HttpGet
    global static void doGet(){
        RestResponse res = RestContext.response;
        RestRequest req = RestContext.request;
        if(req.params.get('hub.verify_toke') == 'WHATSAPPTOKEN'){
            res.responseBody = Blob.valueOf(req.params.get('hub.challenge'));
        }
    }
}