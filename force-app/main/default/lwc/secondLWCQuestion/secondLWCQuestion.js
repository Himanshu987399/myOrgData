import { api, LightningElement} from 'lwc';
import retreveaccount from '@salesforce/apex/SecondLWC.accountretrive';
import retriveopp from '@salesforce/apex/SecondLWC.oppretrive';
import retrivecon from '@salesforce/apex/SecondLWC.conretrive'
export default class SecondLWCQuestion extends LightningElement {
    @api
    accList

    @api
    opplist

    @api
    conlist

    recorId

    connectedCallback(){
        retreveaccount().then(results =>{
            this.accList=results;
            console.log(results);
        })
        .catch(error =>{
            this.accList=error;
        });
    }
    handlechange(event){
        this.recorId= event.target.value;
        retriveopp({accountid:this.recorId}).then(results =>{
            console.log(this.recorId);
            this.opplist=results;
            console.log(results);

        })
        .catch(error=>{
            this.opplist=error;
        });
        retrivecon({accountid:this.recorId}).then(result=>{
            this.conlist=result;
        })
        .catch(error=>{
            this.conlist=error;
        })
    }
}