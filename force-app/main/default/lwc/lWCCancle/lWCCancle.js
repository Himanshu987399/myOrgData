import { api, LightningElement, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
const FIELDS = [
    'Account.Name',
    'Account.Industry',
    'Account.Rating',
    'Account.Website',
];
export default class LWCCancle extends LightningElement {
    //TypeOptions = [test,test1,test2,test3]
    value = 'inProgress';

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
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS}) record;
}