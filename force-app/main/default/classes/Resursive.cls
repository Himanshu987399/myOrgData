public class Resursive {
 //  public static List<Account> accUpdateList;
   public static List<Account> mainmethod(List<Account> accList,Integer size,Integer i){
       List<Account> acc1 = new List<Account>();
        if(i == size){
            return acc1;
        }
       else{ List<Account> acc2 = new List<Account>();
           System.debug('ACCLIST['+i+']-->'+accList[i]);
       		Account acc = new Account();
       		acc.Id = accList[i].Id;
       		acc.Name = 'Him'+i;
       		acc1.add(acc);
       		i++;
       		acc2 = Resursive.mainmethod(accList,size,i);
           return acc1;
       }
       	
    }
    Public static void test(){
        List<Account> accList = [select id,Name from Account Where Name Like '%Himanshu%'];
        Integer sizeOfList = accList.size();
        Integer i = 0;
     //   system.debug('SIZE'+sizeOfList);
     	List<Account> acc =  Resursive.mainmethod(accList,sizeOfList,i);
       
       
    }
    
}