public class uploadfile1 {
    
    @AuraEnabled
    public static String uploadFile(String base64, String filename, String recordId) {
        ContentVersion cv = createContentVersion(base64, filename,recordId);
        
        if (cv == null ) { return null; }
        return cv.Id;
    }
    private static ContentVersion createContentVersion(String base64, String filename,String recordId) {
        ContentVersion cv = new ContentVersion();
        cv.VersionData = EncodingUtil.base64Decode(base64);
        cv.Title = filename;
        cv.Guest_Record_fileupload__c=recordId;
        cv.PathOnClient = filename;
        try {
            insert cv;
            return cv;
        } catch(DMLException e) {
            System.debug(e);
            return null;
        }
    }
   
    
}