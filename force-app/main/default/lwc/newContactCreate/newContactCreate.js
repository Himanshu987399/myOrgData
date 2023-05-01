import { api, LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
const FIELDS = [
    'Contact.Account.Name'
];
export default class LWCCancle extends LightningElement {
    //TypeOptions = [test,test1,test2,test3]
    value = 'inProgress';
    accountName ;
    contacts;
    get options() {
        return [
            { label: 'New', value: 'new' },
            { label: 'In Progress', value: 'inProgress' },
            { label: 'Finished', value: 'finished' },
        ];
    }
    @api recordId;
    connectedCallback(){
        console.log('recordid '+this.recordId);
    }
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS}) record({error,data}){
        if(error){
            let message = 'Unknown error';
            if (Array.isArray(error.body)) {
                message = error.body.map(e => e.message).join(', ');
            } else if (typeof error.body.message === 'string') {
                message = error.body.message;
            }
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error loading contacts',
                    message,
                    variant: 'error',
                }),
            );
        }else if (data) {
            console.log('Hiamnshu'+JSON.stringify(data));
            this.contacts = data;
            this.accountName = this.contacts.fields.Account.displayValue == null ? ' ':this.contacts.fields.Account.displayValue;
            console.log(this.contacts.fields.Account.value.id);
            
        }
    };
    
}