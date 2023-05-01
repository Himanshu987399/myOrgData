public class contactcall {
    @AuraEnabled 
    public static List<sobject> contact(string value, string objectapiname){
        value = '\'' + String.escapeSingleQuotes(value) + '%\'';  
        string query = 'SELECT Id, Name FROM ' +objectapiname+ ' WHERE Name LIKE ' +value+ ' LIMIT 4 ';  
        system.debug(query);
        system.debug(Database.query(query));
        return Database.query(query);  
    }
    @AuraEnabled
    public static void task(string recordaccount,string recordlead,string recordcontact,string recorduser,string dateacc,string firstcombox,string secondcombox){
        system.debug(recordaccount);
        system.debug(recordlead);
        system.debug(recordcontact);
        system.debug(recorduser);
        system.debug(dateacc);
        system.debug(firstcombox);
        system.debug(secondcombox); 
        
        
        Task ts = new Task();
        if(firstcombox!=null)
        {
            ts.Subject =firstcombox;
        }        
        if(dateacc!=null){
            date dt = date.valueOf(dateacc);
            system.debug(dt);
            system.debug(date.today());
            ts.ActivityDate = dt;
        }
        if(recordcontact!=null){
            contact con= [select id,name from contact where name=:recordcontact limit 1];
            system.debug(con);
            ts.WhoId=con.id;
        }
        if(recordlead!=null){
            lead ld =[select id,name from lead where name=:recordlead limit 1];
            System.debug(ld);
            ts.WhoId=ld.id;
        }
        if(recordaccount!=null){
            account acc= [select id,name from account where name=:recordaccount limit 1];
            system.debug(acc);
            ts.WhatId=acc.id;
        }
        if(recorduser!=null){
            user us= [select id,name from user where name=:recorduser limit 1];
            system.debug(us);
            ts.OwnerId=us.id;
        }
        if(secondcombox!=null){
            ts.Status=secondcombox; 
        }
        
        try{
            System.debug(ts);
            insert ts;
        }
        catch(DmlException e){
            system.debug(e);
        }
        
    }
    @AuraEnabled
    public static void task1(string recordaccount1,string recordlead1,string recordcontact1,string firstcombox1,string comments){
        system.debug(recordaccount1);
        system.debug(recordlead1);
        system.debug(recordcontact1);
        system.debug(firstcombox1);
        system.debug(comments);
         Task ts = new Task();
        if(firstcombox1!=null)
        {
            ts.Subject =firstcombox1;
        }        
       
        if(recordcontact1!=null){
            contact con= [select id,name from contact where name=:recordcontact1 limit 1];
            system.debug(con);
            ts.WhoId=con.id;
        }
        if(recordlead1!=null){
            lead ld =[select id,name from lead where name=:recordlead1 limit 1];
            System.debug(ld);
            ts.WhoId=ld.id;
        }
        if(recordaccount1!=null){
            account acc= [select id,name from account where name=:recordaccount1 limit 1];
            system.debug(acc);
            ts.WhatId=acc.id;
        }
        if(comments!=null){
            ts.Description=comments;
        }        
        try{
            System.debug(ts);
            insert ts;
        }
        catch(DmlException e){
            system.debug(e);
        }
        
    }
}