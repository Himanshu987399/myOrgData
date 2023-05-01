import { LightningElement, track } from 'lwc';
import dologin from '@salesforce/apex/loginUser.login';

export default class Login extends LightningElement {

    username;
    password;
    @track errorCheck;
    @track errorMessage;
    handleUserNameChange(event){

        this.username = event.target.value;
    }

    handlePasswordChange(event){
        
        this.password = event.target.value;
    }
    handleLogin(){
        console.log(this.username);
        console.log(this.password);
        if(this.username && this.password){
            
        }else{
            this.errorCheck = true;
                this.errorMessage ='please enter username and password';
        }

    }

}