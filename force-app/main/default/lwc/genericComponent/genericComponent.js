import { api, LightningElement, track,wire } from 'lwc';
import fetchdata from '@salesforce/apex/getAllFieldOfObject.getdata';
export default class GenericComponent extends LightningElement {
    @api objectApiName;
    @api recordId;
    @api fieldMapping;
    RecordList=[];
    listOfFields=[];
    fieldvalue=[];

   
    connectedCallback() {
        this.listOfFields=JSON.parse(this.fieldMapping);
        console.log("Value "+JSON.stringify(this.listOfFields));
        let data1 = this.listOfFields[0];
        console.log(JSON.stringify(this.data1));
        for(let [{key,value}] in this.listOfFields[0]){
            console.log(key);
            console.log(value);
            this.fieldvalue.push(key);
        }
    
        console.log("map--->",JSON.stringify(this.fieldvalue));
        fetchdata({recordId:this.recordId,objectName:this.objectApiName}).then(result=>{
            this.RecordList=result;
            console.log('recordlist-->'+this.RecordList);
        }).catch(error=>{
            console.log('error Happned',error);
        });
       
    }
   // @wire(getRecord, { recordId: '$recordId', fields: [ACCOUNT_NAME_FIELD] })
    //RecordList;
    get updateData(){
        let returnData =[],key=0;
        for(let field in this.RecordList[0]){
            var valued = this.RecordList[0];
            var data = this.listOfFields[0];
            console.log(typeof(data[field]));
            if(typeof(data[field]) != "undefined"){
                returnData.push({
                    key : key++,
                    apiName : field,
                    label:data[field],
                    value:valued[field]
                });
            }
        }
        console.log('returndata'+returnData);
        return returnData;
    }
    
}