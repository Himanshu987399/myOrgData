import { LightningElement, wire } from 'lwc';
//import { CurrentPageReference } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class fileupload extends LightningElement {

    relatedRecordId;
    relatedRecordBool = false;
     

    objectid;
    fileData;
    recordid = '00Q5j00000C0YpDEAV';

   connectedCallback() {
        
       let url = 'https://cloudanalogycom-2dd-dev-ed.my.site.com/s/fileupload?id='+this.recordid;
       let newURL =  new URL(url).searchParams;
       console.log('duiyhgg'+newURL)
       let id = this.relatedRecordId
                ? this.relatedRecordId
                : newURL.get("id");
        this.relatedRecordId = id;
        if(this.relatedRecordId){
             this.relatedRecordBool = true;
            console.log( 'Rec Id is ' + this.relatedRecordId );
        }else{
              this.relatedRecordBool = false;
        }
        console.log('id---->'+this.objectid);

   }
   get acceptedFormats() {
        return ['.xlsx, .xls, .csv, .png, .doc, .docx, .pdf'];
    }
  /*  @wire( CurrentPageReference )
    setCurrentPageReference( currentPageReference ) {

        this.currentPageReference = currentPageReference;
        if ( this.currentPageReference.state.c__recId ) {

            this.relatedRecordId = this.currentPageReference.state.c__recId;
            this.relatedRecordBool = true;
            console.log( 'Rec Id is ' + this.relatedRecordId );

        } else {

          

        }

    }*/

    handleUploadFinished(event) {

        const uploadedFiles = event.detail.files;
        let noOfFiles = uploadedFiles.length;
        console.log( 'No. of files uploaded', noOfFiles );
        this.dispatchEvent(
            new ShowToastEvent( {
                title: 'File(s) Download',
                message: noOfFiles + 'File(s) Uploaded Successfully!!!',
                variant: 'success'
            } ),
        );

    }

}