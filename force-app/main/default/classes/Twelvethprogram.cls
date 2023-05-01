//Print the fibonacci series. 1, 1, 2, 3, 5, 8, 13..
public class Twelvethprogram {
    public static void test(Integer x){
        Integer n=x,a=0,b=1,temp;
        System.debug(a+' '+b);
        for(Integer i=2;i<n;i++){
			temp=a+b;
			a=b;
            b=temp;
			System.debug(temp+' ');        
        }
    }
}