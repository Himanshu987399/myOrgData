import { LightningElement, track } from 'lwc';
import getData from '@salesforce/apex/recorddetails.getDetails';
import getinvdata from '@salesforce/apex/recorddetails.getvalueofInv';

const columns =[
    {label:'Id',fieldName:'Id'},
    {label:'Name', fieldName:'Name'},
    {label:'Unit Number',fieldName:'unit__c'},
]
export default class RecordDetails extends LightningElement {
    rowOffset = 0;
    columns = columns;
    data=[];
    value;
    inventory=[];
    valueaddbutton=false
    dialogbox = false;
    

    //{"Id":"a0N5j000003lSuWEAU","Name":"test1","unit__c":106}
    //[Id: {Id:'',unit:''}]


    connectedCallback(){
        getData()
		.then(result => {
			this.data = result;
           /* let listdata=[];
            for(let key in result){

                result[key].lineItm=[1,2,3,4,5];
                listdata.push(result[key]);
                console.log('after changes:: ',result[key]);
            }
            this.data=listdata;
            */
            console.log(JSON.stringify(this.data));
		})
		.catch(error => {
			alert(error);
		});
        getinvdata().then(result =>{
            this.listofdata=result;
            console.log('list'+JSON.stringify(this.listofdata));
        }).catch(error=>{
            alert(JSON.stringify(error));
        });
        
    }
    checkid;
    newinventory = [];
    listofdata=[];
    listdata=[];
    newdatavalue =[];
    mainValue= new Set();
    nextval = false;
    addInventory(){
        this.dialogbox=true;
        this.nextval=true;
        this.truenewvalue=false;
        var keyvalue =0;
        this.neval=false;
        while(this.mainValue.length > 0) {
            this.mainValue.pop();
        }
        while(this.newvalueofine.length > 0) {
            this.newvalueofine.pop();
        }
        for(let key in this.data){
            let change = this.data[key];
            for(let value in this.listofdata){
                if(this.data[key].Id == this.listofdata[value].Productwithunit__c){
                    if(!this.listdata.includes(change)){
                        this.data[key].key =keyvalue;
                        this.data[key].lineitem=[this.listofdata[value]];
                        this.listdata.push(this.data[key]);
                        keyvalue++;
                    }
                   else{
                        this.newdatavalue=change.lineitem;
                        this.newdatavalue.push(this.listofdata[value]);
                        console.log('new'+JSON.stringify(this.newdatavalue));
                        this.data[key].key =keyvalue;
                        this.data[key].lineitem=this.newdatavalue;
                        console.log('new1'+JSON.stringify(this.data[key].lineitem));
                        this.listdata.push(this.data[key]);
                        keyvalue++;
                    }
                }
                else{
                    if(!this.listdata.includes(change)){
                        this.data[key].key =keyvalue;
                        this.data[key].lineitem=[];
                        this.listdata.push(this.data[key]);
                        keyvalue++;
                    }
                }
            }
           
        }
        this.mainValue = this.listdata;
        this.mainValue.pop();
        console.log('maindata'+JSON.stringify(this.mainValue));
    }
    hideModalBox(){
        this.dialogbox=false;
    }
    newvalueofine=[];
    key=0;
    neval=false;
    onClickAddbutton(event){
        this.key++;
        this.neval=true;
        var currentId =event.target.dataset.name;
        this.newvalueofine.push({Name :'',unitOfProduct__c : '',Productwithunit__c:currentId,key:this.key});
        this.mainValue.find(x => x.Id === currentId).lineitem.push({Name :'',unitOfProduct__c : '',Productwithunit__c:currentId,key:this.key});
        console.log('after click --->'+JSON.stringify(this.mainValue));

    }
    
}