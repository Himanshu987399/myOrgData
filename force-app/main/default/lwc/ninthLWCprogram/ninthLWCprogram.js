import { api, LightningElement, track } from 'lwc';
import getaccount from '@salesforce/apex/Question9Aura.check';
import createaccount from '@salesforce/apex/Question9Aura.value';
export default class NinthLWCprogram extends LightningElement {

    @api
    accountlist

    @track
    accountid

    @track
    contactid

    connectedCallback(){
        getaccount().then(results=>{
            this.accountlist=results;
        })
    }
    lookup(event){
        this.accountid=event.target.value;
    }
    contactidcollect(event){
        this.contactid=event.target.value;
    }
    handleClick(){
        console.log(this.contactid);
        console.log(this.accountid);
        createaccount({ids:this.accountid,ln:this.contactid}).then(restult=>{
            alert('create successfully');
        }).catch(error=>{
            alert(error);
        })
    }
}