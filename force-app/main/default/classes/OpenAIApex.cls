public with sharing class OpenAIApex {
    
    
    @AuraEnabled
    public static object getOpenAIresponse(String prompt) {
        String API_KEY = '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';
        String ENDPOINT = 'https://api.openai.com/v1/engines/davinci-codex/completions';
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(ENDPOINT);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Authorization', 'Bearer ' + API_KEY);
        req.setBody('{\"prompt\":\"' + prompt + '\",\"max_tokens\":2048}');
        HttpResponse res = h.send(req);
        Map<String, Object> result = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        return result ;
    }
}