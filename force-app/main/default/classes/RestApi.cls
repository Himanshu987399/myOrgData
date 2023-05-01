@RESTResource(urlMapping='/CreateLead/')
global class RestApi {

    @HTTPPost
    global static String doPost(){
        return 'hey';
    }
}