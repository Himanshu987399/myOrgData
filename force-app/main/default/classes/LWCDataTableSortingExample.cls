public class LWCDataTableSortingExample {
    @AuraEnabled
    public static List <Contact> getContacts() {
        List<Contact> contList = [ SELECT Id, FirstName, LastName, Phone, Email
                                   FROM Contact];
        system.debug(contlist);
        return contList;
    }   
}