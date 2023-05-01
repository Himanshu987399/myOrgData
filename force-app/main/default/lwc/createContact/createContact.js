import { api, LightningElement } from 'lwc';

export default class CreateContact extends LightningElement {
    @api storeValue;
    connectedCallback(){
        //value=false;
        this.storeValue=false;
    }
}