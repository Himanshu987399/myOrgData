import { LightningElement } from 'lwc';
export default class GlobalPickListLWC extends LightningElement {
    controllerValue;
    dependentValue;
 
    callFromChild(event){
        this.controllerValue = event.detail.controllerValue;
        this.dependentValue = event.detail.dependentValue
        alert(this.controllerValue + '----' + this.dependentValue);
        console.log(JSON.stringify(event.detail));
    }
}