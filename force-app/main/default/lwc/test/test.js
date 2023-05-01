import { LightningElement, track } from 'lwc';

export default class Test extends LightningElement {
       
    onclicksubmit(event){
        console.log('Helooo');
        var username =document.getElementById("gettext").value;
        alert(this.username)
    }
}