import { LightningElement, track } from 'lwc';

export default class Kl extends LightningElement {
    @track id;
    chanedate(){
        console.log(id);
    }
}