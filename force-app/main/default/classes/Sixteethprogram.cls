//WAP to add two binary nos. '100101' & '0101101' which are in text format.
public class Sixteethprogram {
    public static void test(){
        String a='100101';
        String b='0101101';
        String res='';
        System.debug(a+' '+b);
        Integer la=a.length();
        Integer lb=b.length();
        if(la!=lb){
            if(la>lb){
                integer l=la-lb;
                for(integer i=0;i<l;i++){
                    b='0'+b;
                }
            }
            if(lb>la){
                integer l=lb-la;
                for(integer i=0;i<l;i++){
                    a='0'+a;
                }
            }
        }
       	Integer len =a.length();
        integer vali=Integer.valueOf(a);
        Integer valj=Integer.valueOf(b);
   		integer carry=0;
        
        for(Integer i=len;i>=0;i--){
            Integer r1= math.mod(vali,10);
            Integer r2= math.mod(valj,10);
            
            Integer sum=r1+r2+carry;
            
            vali=vali/10;
            valj=valj/10;
            if(sum==1){
                res='1'+res;
                carry=0;
            }
            else if(sum==2){
                res='0'+res;
                carry=1;
            } 
            else if(sum==3){
                res='1'+res;
                carry=1;
            }
            else if(sum==0){
                res='0'+res;
                carry=0;
            }
        }
        System.debug(res);
    }    

}