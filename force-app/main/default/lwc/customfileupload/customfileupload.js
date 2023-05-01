import { LightningElement, wire } from 'lwc';
//import { CurrentPageReference } from 'lightning/navigation';
 
import LightningAlert from 'lightning/alert';

import uploadFile  from '@salesforce/apex/uploadfile1.uploadFile';

export default class customfileupload extends LightningElement {

    relatedRecordId;
    relatedRecordBool = false;
    currentPageReference;
    objectid;
    fileData;
    recordid = '00Q5j00000C0YpDEAV';

   connectedCallback() {
        
       let url = 'https://cloudanalogycom-2dd-dev-ed.my.site.com/s/fileupload?id='+this.recordid;
       let newURL =  new URL(url).searchParams;
       console.log('duiyhgg'+newURL)
       let id = this.objectid
                ? this.objectid
                : newURL.get("id");
        this.objectid = id;
        console.log('id---->'+this.objectid);

   }
    openfileUpload(event) {
        const file = event.target.files[0]
        var reader = new FileReader()
        reader.onload = () => {
            var base64 = reader.result.split(',')[1]
            this.fileData = {
                'filename': file.name,
                'base64': base64,
                'recordId': this.objectid
            }
            console.log(this.fileData)
        }
        reader.readAsDataURL(file)
    }
    handleClick(){
        console.log('fdxgh'+this.fileData);
        
        if(this.fileData != undefined){
            const {base64, filename, recordId} = this.fileData;
            uploadFile({ base64, filename, recordId }).then(result=>{
                console.log('tested');
                this.fileData = null
                LightningAlert.open({
                    message: `${filename} uploaded successfully!!`,
                    theme: 'success' // a red theme intended for error states
                });
                 
            })
        }else{
            console.log('inside');
            
            LightningAlert.open({
                    message: `Please Select Files`,
                    theme: 'error',
                    label: 'Error!', // a red theme intended for error states
                });
        }
        
    }
    toast(title){
        const toastEvent = new ShowToastEvent({
            title, 
            variant:"success"
        })
        this.dispatchEvent(toastEvent)
    }
}