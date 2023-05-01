public class auraquestion5 {
    @AuraEnabled
    public static List<String> allObjects(){  
        try{
            List<String> sObjectList = new List<String>();
            Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe(); 
            for( String ss : gd.keySet())
            {   
                sobjectList.add(ss);   
            }
            System.debug(sobjectList);
            return sObjectList;
        }catch(exception e ){
            system.debug('error========>'+e.getMessage()+'Line=====>'+e.getLineNumber());
            List<String> sObjectList = new List<String>();
            return sObjectList;
        }       
    }
    
    
    
    @AuraEnabled
    public static List<String> fieldsNames(String ids){
        try{
            System.debug('ids==========>'+ids);
            List<String> fieldList = new List<String>();
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Map<String, Schema.SObjectField> fieldMap = schemaMap.get(ids).getDescribe().fields.getMap();
            
            for(String Fields :fieldMap.keySet()){
                fieldList.add(Fields);
            }
            System.debug('fieldList===========>'+fieldList);
            return fieldList;
        }catch(exception e ){
            system.debug('error========>'+e.getMessage()+'Line=====>'+e.getLineNumber());
            List<String> fieldList = new List<String>();
            return fieldList;
        }       
    }
    @AuraEnabled
    public static String forType(String objName, String fieldName){
        try{
            List<String> apiName = new List<String>();
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType leadSchema = schemaMap.get(objName);
            Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
            
            Schema.DisplayType fielddataType = fieldMap.get(fieldName).getDescribe().getType();
            String stringIntance = String.valueOf(fielddataType);
            
            System.debug('fielddataType===========>'+fielddataType);
            
            return stringIntance;
        }catch(exception e ){
            system.debug('error========>'+e.getMessage()+'Line=====>'+e.getLineNumber());
            String s = null;
            return s;
        }               
        
    }
    @AuraEnabled
    public static String forApiName(String objName ,String fieldName){
        try{
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType leadSchema = schemaMap.get(objName);
            Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
            String apiName = fieldMap.get(fieldName).getDescribe().getLabel();
            
            return apiName;
        }catch(exception e ){
            system.debug('error========>'+e.getMessage()+'Line=====>'+e.getLineNumber());
            String s = null;
            return s;
        }            
        
    }
    
}