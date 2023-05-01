import { LightningElement,api } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
export default class Testedcheck extends LightningElement {
    nameValue;
    phoneValue;
    @api objectApiName;
    recordid;
    handleNameChange(event) {
        this.nameValue = event.detail.value;
    }
    handlePhoneChange(event) {
        this.phoneValue = event.detail.value;
    }
    handleCreateRecord(){
        console.log('rtyuiogfg ',typeof(this.nameValue));
        if(this.nameValue){
         }
        else if(this.phoneValue){
         }
        else{
            const fields = {'Name' : this.nameValue, 'Phone' : this.phoneValue};
            console.log('value--->'+JSON.stringify(fields));
            const objRecordInput = {'apiName':this.objectApiName, fields};
            console.log('tested--->'+this.objRecordInput);
            createRecord(objRecordInput).then(response => {
                this.recordid = response.id;
            }).catch(error => {
                alert('Error: ' +JSON.stringify(error));
            });
        }
      
    }
}