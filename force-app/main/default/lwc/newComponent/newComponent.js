import { LightningElement, track } from 'lwc';

export default class NewComponent extends LightningElement {
    onAddClick(){
        this.dispatchEvent(new CustomEvent('add'))
    }
}