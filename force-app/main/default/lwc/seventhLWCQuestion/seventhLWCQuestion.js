import { LightningElement, track } from 'lwc';
import checked from '@salesforce/apex/SeventhLWC.checked';
export default class SeventhLWCQuestion extends LightningElement {
    @track
    password
    @track
    username

    userchange(event){
        this.username=event.target.value;
    }
    passchange(event){
        this.password=event.target.value;
    }
    handleClick(){
        checked({username:this.username,password:this.password}).then(result=>{
            if(result==1){
                alert("Successfully Login");
            }
            else{
                alert('Login failed');
            }
        }).catch(error=>{
            alert(error);
        });
    }
}