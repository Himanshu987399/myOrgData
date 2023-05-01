import { LightningElement } from 'lwc';

export default class CalculatorProgram extends LightningElement {
    value = [];
    connectedCallback(){
        this.value.push({
            description :'My name is khan',
            name : 'Himanshu Sharma',
            
        });
    }
}