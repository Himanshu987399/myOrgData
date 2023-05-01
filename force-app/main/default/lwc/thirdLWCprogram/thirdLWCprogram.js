import { LightningElement, track } from 'lwc';
import callopplist from '@salesforce/apex/LightningApex3.oppcheck';
import update from '@salesforce/apex/LightningApex3.updatecheck'
export default class ThirdLWCprogram extends LightningElement {
    
    oppList
    @track
    update
    @track
    record
    connectedCallback(){
        callopplist().then(results=>{
            this.oppList=results;
        }).catch(error=>{
            alert(error);
        });
    }
    updateopportunity(event){
        this.update=event.target.value;
    }
    handlechange(event){
        this.record=event.target.value;
    }
    handleClick(){
        update({closedd:this.update,opp:this.record}).then(restuls=>{
            alert('update successfully');
        })
        .catch(error=>{
            alert(error);
        })
    }

}