import { LightningElement } from 'lwc';
import serachContact from '@salesforce/apex/getContact.getvalue';
const columns=[
     { label: 'Id', fieldName: 'Id' },
     {label:'Contact Name', fieldName:'Name'}
]
export default class Datatable extends LightningElement {
    accountName;
    data;
    columns = columns;
    onAccountNameValue(event){
        this.accountName = event.target.value;
    }
    handleClick(){
        
        serachContact({accountName:this.accountName}).then(result=>{
            
          
                this.data = result;
           
        }).catch(error=>{
            alert('Error--->'+error);
        })
    }
}