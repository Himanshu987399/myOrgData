public class PasswordGenerator {
    public static String generatePassword(Integer length){
        String randomString ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-={}[]|\\:;"<>,.?/~`';
        String randStr = '';
        while (randStr.length() < length) {
            Integer idx = Math.mod(Math.abs(Crypto.getRandomInteger()), randomString.length());
            randStr += randomString.substring(idx, idx+1);
        }
        return randStr;
    }

}