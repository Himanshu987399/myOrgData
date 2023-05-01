import { LightningElement,wire,track } from 'lwc';
import { getPicklistValuesByRecordType} from 'lightning/uiObjectInfoApi';
import PROPERTY_OBJECT from '@salesforce/schema/Property__c';
import searchPropertyApex from '@salesforce/apex/searchPropertyApex.getProperty';
const columns = [
    { label: 'Property Name', fieldName: 'Name' },
    { label: 'Owner Name', fieldName: 'Owner_Name__c'},
    { label: 'Phone', fieldName: 'Phone_No__c', type: 'phone' },
    { label: 'Address', fieldName: 'Address__c', type: 'text' },
];
export default class searchProperty extends LightningElement {
    columns = columns;
    controllingPicklist=[];
    dependentPicklist;
    @track finalDependentVal=[];
    @track selectedControlling="--None--";
    showpicklist = false;
    dependentDisabled=true;
    showdependent = false;
    selectedCountry;
    selectedState;
    showSearchButton = false;
    listOfData;
    showListOfRecord = false;
    showZeroRecord = false;
    @wire(getPicklistValuesByRecordType, { objectApiName: PROPERTY_OBJECT, recordTypeId: '012000000000000AAA' })
    propertyOrFunction({error,data}){
        if(data && data.picklistFieldValues){
            let optionsValue = {}
            optionsValue["label"] = "--None--";
            optionsValue["value"] = "--None--";
            this.controllingPicklist.push(optionsValue);
            data.picklistFieldValues["Country__c"].values.forEach(optionData => {
                this.controllingPicklist.push({label : optionData.label, value : optionData.value});
            });
            this.dependentPicklist = data.picklistFieldValues["State__c"];
            this.showpicklist = true;
        }
        if(error){
            console.log('Error-->'+error);
        }
    }
    fetchDependentValue(event){
        this.finalDependentVal=[];
        this.showdependent = false;
        const selectedVal = event.target.value;
        this.selectedCountry = event.target.value; 
        this.finalDependentVal.push({label : "--None--", value : "--None--"})
        let controllerValues = this.dependentPicklist.controllerValues;
        this.dependentPicklist.values.forEach(depVal => {
            depVal.validFor.forEach(depKey =>{
                if(depKey === controllerValues[selectedVal]){
                    this.dependentDisabled = false;
                    this.showdependent = true;
                    this.finalDependentVal.push({label : depVal.label, value : depVal.value});
                }
            });
            
        });
    }
    fetchStateValue(event){
        this.selectedState = event.target.value;
        this.showSearchButton = true;
    }
    handleClick(){
        searchPropertyApex({country:this.selectedCountry,state:this.selectedState}).then((data) =>{
                if(data != ''){
                    this.showZeroRecord = false;
                    this.listOfData = data;
                    this.showListOfRecord = true;
                }else{
                    this.showListOfRecord = false;
                    this.showZeroRecord = true;
                }
                
            })
            .catch((error)=>{
                console.log('Error --> '+error);
            });
    }
}