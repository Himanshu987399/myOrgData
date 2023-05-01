import { LightningElement, track,api } from 'lwc';
import contactcalldf from '@salesforce/apex/contactcall.contact';

export default class Relatedto extends LightningElement {
   
    
  @track recordsListaccount;  
  @track searchKeyaccount = "";  
  @api selectedValueaccount=false;  
  @api selectedRecordIdaccount;
  
  @track messageaccount;  
  onLeaveaccount(event) {  
    setTimeout(() => {  
     this.searchKeyaccount = "";  
     this.recordsListaccount = null;  
    }, 300);  
   }  
   onRecordSelectionaccount(event) {  
    this.selectedRecordIdaccount = event.target.dataset.key;  
    this.selectedValueaccount = event.target.dataset.name;  
    this.searchKeyaccount = "";  
    this.onSeletedRecordUpdateaccount();  
   }  
   handleKeyChangeaccount(event) {  
    const searchKeyaccount = event.target.value;  
    this.searchKey = searchKeyaccount;  
    this.getLookupResultaccount();  
   }  
   removeRecordOnLookupaccount(event) {  
    this.searchKeyaccount = "";
    this.selectedValueaccount = null;  
    this.selectedRecordIdaccount = null;  
    this.recordsListaccount = null;
    this.onSeletedRecordUpdateaccount();  
  }  
  @api contactobject="account";
 getLookupResultaccount() {  
    contactcalldf({value: this.searchKey,objectapiname:this.contactobject})  
     .then((result) => {  
      if (result.length==0) {  
        this.recordsList = [];  
        this.message = "No Records Found";  
       } else {  
           console.log(result);
        this.recordsList = result;  
        this.message = "";  
       }  
       this.error = undefined;  
     })  
     .catch((error) => {  
      this.error = error;  
      this.recordsList = undefined;  
     });  
   }  
   onSeletedRecordUpdateaccount(){  
    const passEventr = new CustomEvent('recordselection', {  
      detail: { selectedRecordIdaccount: this.selectedRecordIdaccount, selectedValueaccount: this.selectedValueaccount }  
     });  
     this.dispatchEvent(passEventr);  
   }
}