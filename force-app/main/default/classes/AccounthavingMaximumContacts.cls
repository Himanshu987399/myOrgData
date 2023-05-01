// WAP to find top 5 account having maximum number of Contacts.

public class AccounthavingMaximumContacts {
    public static void test(){
        List<Account> acclist=new List <Account>();
        acclist=[Select id,name from Account];
        
        List<Contact> contlist=new List<Contact>();
        contlist=[Select id,name, AccountId From Contact where AccountId IN: acclist];
        
        
        Map<ID, INTEGER> conmap=new Map<ID, INTEGER>();
        
        for(Contact con : contlist)
        {
            if(!conmap.containskey(con.AccountId))
            {
                conmap.put(con.AccountId,1);
            }
            else 
            {
                Integer count=conmap.get(con.AccountId)+1;
                conmap.put(con.AccountId,count);
            }
        }
        list<Id> tst = new List<Id>();
        List <Integer> valuelist=new List <Integer>();
        valuelist=conmap.values();
        valuelist.sort();
        set<integer> idset = new set<integer>();
        for(Integer i = 0 ; i<=valuelist.size()-1 ;i++){
            idset.add(valuelist[i]);
        }
        List<integer> value = new list<integer>();
        value.addAll(idset);
        
        system.debug('value'+idset);
        system.debug('list value'+value);
        integer j=0;
        for(Integer i = 0 ; i<=value.size()-1 ;i++ )
        {
            Integer maxvalue=value[i];
            j=1;
            for( String key:conmap.keyset())
            {
                
                Integer keyvalue = conmap.get(key);
                if(keyvalue==maxvalue && (!tst.contains(key)) && j==1)
                {
                    tst.add(key);
                    j=0;
                    //System.debug('Id is : '+key +'value is : '+keyvalue);
                    
                }
            }
            
        }
        
        for(Integer i=0;i<5;i++)
        {
            System.debug(tst[i]);
        }
    }
    
}