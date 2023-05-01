import { LightningElement, track } from 'lwc';
import listofData from '@salesforce/apex/listOfDataRecord.getAccount';
const columns = [
    { label: 'Name', fieldName: 'Name'},
    { label: 'Id', fieldName: 'Id' },
    { label: 'Industry', fieldName: 'Industry' },
    { label: 'Last Modified Date', fieldName: 'LastModifiedDate' },
    { label: '', type:'button-icon', typeAttributes: {
                disabled: false,
                variant: 'base',
                value: 'goto',
                iconClass: 'slds-align_absolute-center',
                iconPosition: 'right',
                iconName:'utility:forward'
            }
           
    }

];
export default class TaskGivenByChatGPT extends LightningElement {
    @track searchValue;
    accounts = [];
    columns = columns;
    showTable = false;
    noRecords = false;
    searchDataChange(event) {
        this.searchValue = event.target.value;
    }
    serachDataClick() {
        listofData({ name: this.searchValue }).then(result => {
            this.accounts = result;
            console.log('OUTPUT : ', JSON.stringify(this.accounts));
            if (this.accounts.length == 0) {
                this.noRecords = true;
                this.showTable = false;
            } else {
                this.showTable = true;
                this.noRecords = false;
            }
        }).catch(error => {
            console.log('Error-->', error);
        })
    }
}