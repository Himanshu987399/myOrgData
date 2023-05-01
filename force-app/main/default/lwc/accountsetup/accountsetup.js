import { api, LightningElement, track } from 'lwc';
import contactcalldf from '@salesforce/apex/contactcall.contact';
import taskcreate from '@salesforce/apex/contactcall.task';
import taskcreate3 from '@salesforce/apex/contactcall.task1';

export default class Accountsetup extends LightningElement {
    @track value
    @track values
    
   @track dinak;
   datechange(event){
     this.dinak=event.target.value;
   }
    get options() {
        return [
            { label: '--None--',value:''},
            { label: 'Call', value: 'call' },
            { label: 'Email', value: 'email' },
            { label: 'Send Letter', value: 'sendletter' },
            { label: 'Send Quote',value:'sendquote'},
            { label: 'Other',value:'other'},


        ];
    }
    get optionsvalue() {
      return [
          { label: '--None--',value:''},
          { label: 'Not Started', value: 'notstarted' },
          { label: 'In Progress', value: 'inprogress' },
          { label: 'Completed', value: 'completed' },
          { label: 'Wait for someone else',value:'waitforsomeoneelse'},
          { label: 'Deferred',value:'deferred'},


      ];
  }

  handleChangevalue(event){
    this.values=event.detail.value;
}

@track logvalue;
handleChangelog(event){
  this.logvalue=event.detail.value;
}
    handleChange(event){
        this.value=event.detail.value;
    }
    @track changecontactvalue;
    setup(event){
        const searchkey = event.target.value;
        this.contactsearch=searchkey;
        this.getcontact();
    }
  @track recordsList;
  @track recordsListuser;  
  @track searchKey = "";  
  @api selectedValue;
  @api selectedValuelead;  
  @api selectedValueuser;  
  @track searchKeyuser = "";
  @api selectedRecordId;
  @api selectedRecordIdlead;  
  @api selectedRecordIduser;  
  
  @track message;  
  @track messageuser;  

  @track checked001=true;

  @track message1;  
  @api selectedRecordId1;
  @api selectedRecordIdlead1; 
  @track recordsList1;
  @track recordsListlead1;
  @track searchKey1 = "";  
  @api selectedValue1;
  @api selectedValuelead1;
  @track searchKeylead1="";
  



  onLeave(event) {  
   setTimeout(() => {  
    this.searchKey = "";  
    this.recordsList = null;  
   }, 300);  
  }
  onLeave1(event) {  
    setTimeout(() => {  
     this.searchKey1 = "";  
     this.recordsList1 = null;  
    }, 300);  
   }    
  @track searchKeylead="";
  @track recordsListlead;
  onLeavelead(event){
    setTimeout(() => {  
      this.searchKeylead = "";  
      this.recordsListlead = null;  
     }, 300);  
  } 
  onLeaveuser(event) {  
    setTimeout(() => {  
     this.searchKeyuser = "";  
     this.recordsListuser = null;  
    }, 300);  
   }  
  onRecordSelectionlead(event){
    this.selectedRecordIdlead = event.target.dataset.key;  
    this.selectedValuelead = event.target.dataset.name;
    this.searchKeylead = "";  
    this.onSeletedRecordUpdatelead();    
  }
  onRecordSelection(event) {  
   this.selectedRecordId = event.target.dataset.key;  
   this.selectedValue = event.target.dataset.name;  
   this.searchKey = "";  
   this.onSeletedRecordUpdate();  
  } 
  onRecordSelectionlead1(event){
    this.selectedRecordIdlead1 = event.target.dataset.key;  
    this.selectedValuelead1 = event.target.dataset.name;
    this.searchKeylead1 = "";  
    this.onSeletedRecordUpdatelead1();    
  }
  onRecordSelection1(event) {  
   this.selectedRecordId1 = event.target.dataset.key;  
   this.selectedValue1 = event.target.dataset.name;  
   this.searchKey1 = "";  
   this.onSeletedRecordUpdate1();  
  }  
  onRecordSelectionuser(event){
    this.selectedRecordIduser = event.target.dataset.key;  
    this.selectedValueuser = event.target.dataset.name;
    this.searchKeyuser = "";  
    this.onSeletedRecordUpdateuser();    
  }
  handleKeyChange(event) {  
   const searchKey = event.target.value;  
   this.searchKey = searchKey;  
   this.getLookupResult();  
  }  

  handleKeyChangelead(event){
    const searchKey = event.target.value;  
    this.searchKeylead = searchKey;  
    this.getLookupResultlead(); 
  }
  handleKeyChange1(event) {  
    const searchKey1 = event.target.value;  
    this.searchKey1 = searchKey1;  
    this.getLookupResult1();  
   }  
 
   handleKeyChangelead1(event){
     const searchKey1 = event.target.value;  
     this.searchKeylead1 = searchKey1;  
     this.getLookupResultlead1(); 
   }
  handleKeyChangeuser(event){
    const searchKey = event.target.value;  
    this.searchKeyuser = searchKey;  
    this.getLookupResultuser(); 
  }
   
  removeRecordOnLookup(event) {  
   this.searchKey = "";
   this.selectedValue = null;  
   this.selectedRecordId = null;  
   this.recordsList = null;
   this.onSeletedRecordUpdate();  
 }  
 removeRecordOnLookup1(event) {  
  this.searchKey1 = "";
  this.selectedValue1 = null;  
  this.selectedRecordId1 = null;  
  this.recordsList1 = null;
  this.onSeletedRecordUpdate1();  
}  
 removeRecordOnLookupuser(event) {  
  this.searchKeyuser = "";
  this.selectedValueuser = null;  
  this.selectedRecordIduser = null;  
  this.recordsListuser = null;
  this.onSeletedRecordUpdateuser();  
}  
 removeRecordOnLookuplead(event){
  this.searchKeylead="";
  this.selectedRecordIdlead = null;
  this.selectedValuelead=null;
  this.recordsListlead=null;
  this.onSeletedRecordUpdatelead(); 
 }
 removeRecordOnLookuplead1(event){
  this.searchKeylead1="";
  this.selectedRecordIdlead1 = null;
  this.selectedValuelead1=null;
  this.recordsListlead1=null;
  this.onSeletedRecordUpdatelead1(); 
 }
 @api contactobject="contact";
 getLookupResult() {  
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
   getLookupResult1() {  
    contactcalldf({value: this.searchKey1,objectapiname:this.contactobject})  
     .then((result) => {  
      if (result.length==0) {  
        this.recordsList1 = [];  
        this.message1 = "No Records Found";  
       } else {  
           console.log(result);
        this.recordsList1 = result;  
        this.message1 = "";  
       }  
       this.error = undefined;  
     })  
     .catch((error) => {  
      this.error = error;  
      this.recordsList1 = undefined;  
     });  
   }  
   @api userobject="user"
   getLookupResultuser() {  
    contactcalldf({value: this.searchKeyuser,objectapiname:this.userobject})  
     .then((result) => {  
      if (result.length==0) {  
        this.recordsListuser = [];  
        this.messageuser = "No Records Found";  
       } else {  
           console.log(result);
        this.recordsListuser = result;  
        this.messageuser = "";  
       }  
       this.error = undefined;  
     })  
     .catch((error) => {  
      this.error = error;  
      this.recordsListuser = undefined;  
     });  
   }  
   @track messagelead;  
   @api leadapi="lead";
   getLookupResultlead(){
    contactcalldf({value:this.searchKeylead,objectapiname:this.leadapi}).then((result)=>{
      if(result.length==0){
        this.recordsListlead=[];
        this.messagelead ="No Records Found";

      }else{
        console.log(result);
        this.recordsListlead=result;
        this.messagelead="";
        
      }
      this.error = undefined;
    }).catch((error)=>{
      this.error=error;
      this.recordsListlead = undefined;
    })
   }
   getLookupResultlead1(){
    contactcalldf({value:this.searchKeylead1,objectapiname:this.leadapi}).then((result)=>{
      if(result.length==0){
        this.recordsListlead1=[];
        this.messagelead1 ="No Records Found";

      }else{
        console.log(result);
        this.recordsListlead1=result;
        this.messagelead1="";
        
      }
      this.error = undefined;
    }).catch((error)=>{
      this.error=error;
      this.recordsListlead1 = undefined;
    })
   }
   onSeletedRecordUpdate(){  
    const passEventr = new CustomEvent('recordselection', {  
      detail: { selectedRecordId: this.selectedRecordId, selectedValue: this.selectedValue }  
     });  
     this.dispatchEvent(passEventr);  
   }
   onSeletedRecordUpdatelead(){  
    const passEventr = new CustomEvent('recordselection', {  
      detail: { selectedRecordIdlead: this.selectedRecordIdlead, selectedValuelead: this.selectedValuelead }  
     });  
     this.dispatchEvent(passEventr);  
   }
   onSeletedRecordUpdateuser(){  
    const passEventr = new CustomEvent('recordselection', {  
      detail: { selectedRecordIduser: this.selectedRecordIduser, selectedValueuser: this.selectedValueuser }  
     });  
     this.dispatchEvent(passEventr);  
   }
   onSeletedRecordUpdate1(){  
    const passEventr = new CustomEvent('recordselection', {  
      detail: { selectedRecordId1: this.selectedRecordId1, selectedValue1: this.selectedValue1 }  
     });  
     this.dispatchEvent(passEventr);  
   }
   onSeletedRecordUpdatelead1(){  
    const passEventr = new CustomEvent('recordselection', {  
      detail: { selectedRecordIdlead1: this.selectedRecordIdlead1, selectedValuelead1: this.selectedValuelead1 }  
     });  
     this.dispatchEvent(passEventr);  
   }
   @track checked002=false;
   changecontact(){
      if(this.checked002==false){
        this.checked002=true;
      }
      else{
        this.checked002=false;
      }
     
      
   }
   changedcontact(){
     this.checked002=false;
     if(this.checked001==false){
       this.checked001=true;
       this.checked003=false;
     }
   }
   @track checked003=false;
   changedlead(){
     if(this.checked003==false){
      this.checked001=false;
      this.checked002=false;
      this.checked003=true;
     }
     else{
      this.checked001=false;
      this.checked002=false;
     }
    
   }
   @track checked0011=true;

   @track checked0021=false;
   changecontact1(){
      if(this.checked0021==false){
        this.checked0021=true;
      }
      else{
        this.checked0021=false;
      }
     
      
   }
   changedcontact1(){
     this.checked0021=false;
     if(this.checked0011==false){
       this.checked0011=true;
       this.checked0031=false;
     }
   }
   @track checked0031=false;
   changedlead1(){
     if(this.checked0031==false){
      this.checked0011=false;
      this.checked0021=false;
      this.checked0031=true;
     }
     else{
      this.checked0011=false;
      this.checked0021=false;
     }
    
   }



  @track recordsListaccount;  
  @track searchKeyaccount = "";  
  @api selectedValueaccount;  
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
    this.searchKeyaccount = searchKeyaccount;  
    this.getLookupResultaccount();  
   }  
   removeRecordOnLookupaccount(event) {  
    this.searchKeyaccount = "";
    this.selectedValueaccount = null;  
    this.selectedRecordIdaccount = null;  
    this.recordsListaccount = null;
    this.onSeletedRecordUpdateaccount();  
  }  
  @api contactobjectaccount="account";
  getLookupResultaccount() {  
    contactcalldf({value: this.searchKeyaccount,objectapiname:this.contactobjectaccount})  
     .then((result) => {  
      if (result.length==0) {  
        this.recordsListaccount = [];  
        this.messageaccount = "No Records Found";  
       } else {  
           console.log(result);
        this.recordsListaccount = result;  
        this.messageaccount = "";  
       }  
       this.error = undefined;  
     })  
     .catch((error) => {  
      this.error = error;  
      this.recordsListaccount = undefined;  
     });  
   }  
   onSeletedRecordUpdateaccount(){  
    const passEventr = new CustomEvent('recordselection', {  
      detail: { selectedRecordIdaccount: this.selectedRecordIdaccount, selectedValueaccount: this.selectedValueaccount }  
     });  
     this.dispatchEvent(passEventr);  
   }
   @track recordsListaccount1;  
   @track searchKeyaccount1 = "";  
   @api selectedValueaccount1;  
   @api selectedRecordIdaccount1;
   
   @track messageaccount1;  
   onLeaveaccount1(event) {  
     setTimeout(() => {  
      this.searchKeyaccount1 = "";  
      this.recordsListaccount1 = null;  
     }, 300);  
    }  
    onRecordSelectionaccount1(event) {  
     this.selectedRecordIdaccount1 = event.target.dataset.key;  
     this.selectedValueaccount1 = event.target.dataset.name;  
     this.searchKeyaccount1 = "";  
     this.onSeletedRecordUpdateaccount1();  
    }  
    handleKeyChangeaccount1(event) {  
     const searchKeyaccount1 = event.target.value;  
     this.searchKeyaccount1 = searchKeyaccount1;  
     this.getLookupResultaccount1();  
    }  
    removeRecordOnLookupaccount1(event) {  
     this.searchKeyaccount1 = "";
     this.selectedValueaccount1 = null;  
     this.selectedRecordIdaccount1 = null;  
     this.recordsListaccount1 = null;
     this.onSeletedRecordUpdateaccount1();  
   }  
  
   getLookupResultaccount1() {  
     contactcalldf({value: this.searchKeyaccount1,objectapiname:this.contactobjectaccount})  
      .then((result) => {  
       if (result.length==0) {  
         this.recordsListaccount1 = [];  
         this.messageaccount1 = "No Records Found";  
        } else {  
            console.log(result);
         this.recordsListaccount1 = result;  
         this.messageaccount1 = "";  
        }  
        this.error = undefined;  
      })  
      .catch((error) => {  
       this.error = error;  
       this.recordsListaccount1 = undefined;  
      });  
    }  
    onSeletedRecordUpdateaccount1(){  
     const passEventr = new CustomEvent('recordselection', {  
       detail: { selectedRecordIdaccount1: this.selectedRecordIdaccount1, selectedValueaccount1: this.selectedValueaccount1 }  
      });  
      this.dispatchEvent(passEventr);  
    }
    @track comments;
    commentupdate(event){
      this.comments=event.target.value;
    }
   taskcreate1(){
     console.log(this.selectedValueaccount);
     console.log(this.selectedValuelead);

     console.log(this.selectedValue);

     console.log(this.selectedValueuser);

     console.log(this.dinak);
     console.log(this.value);


    console.log(this.values);
    taskcreate({recordaccount:this.selectedValueaccount,recordlead:this.selectedValuelead,recordcontact:this.selectedValue,recorduser:this.selectedValueuser,dateacc:this.dinak,firstcombox:this.value,secondcombox:this.values}).then(result=>{
        alert("create successfully task");
    }).catch(error=>{
      alert(error);
    })
   }
   taskcreate2(){
    console.log(this.selectedValueaccount1);
    console.log(this.selectedValuelead1);

    console.log(this.selectedValue1);
    console.log(this.comments);
    console.log(this.logvalue);
    taskcreate3({recordaccount1:this.selectedValueaccount1,rerecordlead1:this.selectedValuelead1,recordcontact1:this.selectedValue1,firstcombox1:this.logvalue,comments:this.comments}).then(result=>{
      alert("create successfully task");
  }).catch(error=>{
    alert(error);
  })
    

   }
        
}