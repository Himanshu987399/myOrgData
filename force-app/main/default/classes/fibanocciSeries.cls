public class fibanocciSeries {
    public static void printSerires(Integer numbers){
        Integer a = 0,b = 1;
        system.debug(a+', '+b);
        for(Integer i = 0;i<numbers;i++){
            Integer temp = a + b;
            system.debug(', '+temp);
            a = b;
            b = temp;
        }
            
            
    }
}