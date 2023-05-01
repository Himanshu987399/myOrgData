public class CustomSorter {
    public static List<Integer> sortInteger(List<Integer> valueOfData){
        Integer i = valueOfData.size();
        Integer j = i+1;
        if(i == 1){
            return valueOfData;
        }
        else{
            for(Integer k=0;k<i;k++){
                for(Integer l=k+1;l<i;l++){
                    if(valueOfData[k] > valueOfData[l]){
                        Integer temp = valueOfData[k];
                        valueOfData[k] = valueOfData[l];
                        valueOfData[l] = temp;
                    }
                }
            }
            return valueOfData;
        }
        
    }
    @AuraEnabled
    public static string getExpose(){
        
        Http h = new Http();
        
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://getaccounts-8ye202.5sc6y6-3.usa-e2.cloudhub.io/accounts');
        req.setMethod('GET');
        
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        system.debug('data-->'+res.getBody());
        return res.getBody();
    }
}