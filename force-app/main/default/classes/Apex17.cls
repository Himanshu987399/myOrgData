//Write a program in Salesforce to create another System admin user in your dev org with your email. Register the user manually.
public class Apex17 {  
    public static void test(){
        Profile proid = new Profile();
        proid =[select id from profile where name='system administrator' limit 1];
        User uid = new User();
        uid.Alias = 'Hima9873';
        uid.LastName='sharma';
        uid.Email ='Himanshuthereallion@gmail.com';
        uid.Username='Himanshu987@gmail.com';
        uid.CommunityNickname ='Himanshu987399';
        uid.ProfileId=proid.id;
        uid.EmailEncodingKey='UTF-8';
        uid.LocaleSidKey='en_US';
        uid.TimeZoneSidKey='GMT';
        uid.LanguageLocaleKey='en_US';
        
        insert uid;
        
    }
}