public class recorddetails {
    @AuraEnabled 
    public static List<Productwithunit__c> getDetails(){
        return [select id,Name,unit__c from Productwithunit__c];
    }
    @AuraEnabled 
    public static List<inventory__c> getvalueofInv(){
        List<Productwithunit__c> pro =[select id,Name,unit__c from Productwithunit__c];
        List<inventory__c> inventory = [select id,Name,unitOfProduct__c,Productwithunit__c  from inventory__c where Productwithunit__c IN: pro];
        /*Map<String,List<inventory__c>> maplist = new Map<String,List<inventory__c>>();
        Map<Map<String,String>,Map<String,List<inventory__c>>> maplistwithname = new  Map<Map<String,String>,Map<String,List<inventory__c>>>();
        Map<String,String> nameofproduct= new Map<String,String>();
        Map<String,List<inventory__c>> Listofinventory= new Map<String,List<inventory__c>>();
        for(Productwithunit__c prolist : pro){
            for(inventory__c inv : inventory){
                if(inv.Productwithunit__c == prolist.id){
                    if(!maplist.containsKey(prolist.Name)){
                        List<inventory__c> invlist =new List<inventory__c>();
                        invlist.add(inv);
                        maplist.put(prolist.Name,invlist);                  
                    }
                    else{
                        List<inventory__c> invlist =maplist.get(prolist.Name);
                        invlist.add(inv);
                        maplist.put(prolist.Name,invlist);
                    }
                }
                else{
                    if(!maplist.containsKey(prolist.Name)){
                        List<inventory__c> invlist =new List<inventory__c>();
                        maplist.put(prolist.Name,invlist);
                    }
                }
            }
        }*/
        /*map<string,List<inventory__c>> mapnew = new map<string,List<inventory__c>>();
        for(inventory__c inv : inventory){
            if(!mapnew.containsKey('data')){
                List<inventory__c> invlist =new List<inventory__c>();
                invlist.add(inv);
                mapnew.put('data',invlist);                  
            }
            else{
                List<inventory__c> invlist =mapnew.get(inv.Productwithunit__c);
                invlist.add(inv);
                mapnew.put('data',invlist);
            }
            
        }   
        System.debug('Mapnew-->'+mapnew);*/
        return inventory;
    }
    
}