import { LightningElement,api, track } from 'lwc';
import values from '@salesforce/apex/getAllFieldOfObject.getdata';

export default class DetailsPage extends LightningElement {
    @api recordId;
    @api objectApiName;
    data=[];
    @track maindata=[];
    valuecheck=[];
    connectedCallback(){
        console.log('recordId1111--> ',this.recordId);
        console.log('objectapiname--> ',this.objectApiName);
        values({recordId:this.recordId,objectName:this.objectApiName}).then(result=>{
            this.data=result;
            console.log('Data-->',result);
            var valued =this.data[0];
            var key = 0;
            for(let field in this.data[0]){
                this.maindata.push({
                    keys : key++,
                    label : field,
                    value: valued[field]
                })
            }
         // this.maindata = JSON.stringify(this.maindata);
            console.log('maindata-->',this.maindata);
        }).catch(error=>{
            console.log('error Happned',error);
        })
    }
}