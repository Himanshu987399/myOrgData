import { api, LightningElement, track } from 'lwc';
import allobject from '@salesforce/apex/auraquestion5.allObjects';
import allfield from '@salesforce/apex/auraquestion5.fieldsNames';
import fieldtype from '@salesforce/apex/auraquestion5.forType';
import apiname from '@salesforce/apex/auraquestion5.forApiName';

export default class FoutthLWCprogram extends LightningElement {

    @api
    object
    @api
    filledname

    @api
    fieldtype
    @api
    apiname

    @track
    objectid
    @track
    fieldch

    connectedCallback(){
        allobject().then(results=>{
            this.object=results;
            console.log(this.object);
        }).catch(error=>{
            alert(error);
        });
    }

    objectvalue(event){
        console.log("checked");
        this.objectid=event.target.value;
        console.log(this.objectid);
        allfield({ids:this.objectid}).then(result=>{
            this.filledname=result;
            console.log(result);
        })
        .catch(error=>{
            alert(error);
        });
    }
    filledchange(event){
        this.fieldch=event.target.value;
        fieldtype({objName:this.objectid,fieldName:this.fieldch}).then(retsult=>{
            this.fieldtype = retsult;
        })
        .catch(error=>{
            alert(error);
        });
        apiname({objName:this.objectid,fieldName:this.fieldch}).then(result=>{
            this.apiname = result;
        })
        .catch(error=>{
            alert(error);
        })

    }

}