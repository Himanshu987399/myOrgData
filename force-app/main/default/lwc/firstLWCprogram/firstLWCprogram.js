/*import { api, LightningElement } from 'lwc';
import getupdate from '@salesforce/apex/firstLWCapex.insertperform';

export default class FirstLWCprogram extends LightningElement {
    @api
    name;
    @api
    account_no;
    
    
    handleClick(){

        console.log(this.name);
        console.log(this.account_no);
        console.log('Hello');
        getupdate({name:this.name,accountno:this.account_no});
        console.log('Hello091');
    }
}
js:

*/
import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
export default class SecondComp extends LightningElement {
 
    strName;
    strAccountNumber;
    strPhone;
    // Change Handlers.
    nameChangedHandler(event){
        this.strName = event.target.value;
    }
    numberChangedHandler(event){
        this.strAccountNumber = event.target.value;
    }
    phoneChangedHandler(event){
        this.strPhone = event.target.value;
    }
    
    createAccount(){
        
        var fields = {'Name' : this.strName, 'AccountNumber' : this.strAccountNumber, 'Phone' : this.strPhone};
        // Record details to pass to create method with api name of Object.
        var objRecordInput = {'apiName' : 'Account', fields};
        // LDS method to create record.
        createRecord(objRecordInput).then(response => {
            alert('Account created with Id: ' +response.id);
        }).catch(error => {
            alert('Error: ' +JSON.stringify(error));
        });
    }
}