import { LightningElement, track } from 'lwc';
import listofData from '@salesforce/apex/listOfDataRecord.getRecords';
import listofRecords from '@salesforce/apex/listOfDataRecord.getAllRecords';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Notes', fieldName: 'Notes__c' },
    { label: 'Date Applied', fieldName: 'Date_applied__c' },
    { label: 'Email', fieldName: 'Email__c' },
    {
        label: '', type: 'button-icon', typeAttributes: {
            disabled: false,
            variant: 'base',
            value: 'goto',
            iconClass: 'slds-align_absolute-center',
            iconPosition: 'right',
            iconName: 'utility:forward'
        }

    }

];
export default class ListofRecord extends LightningElement {
    showSpinner = true;
    @track value = 'All Records';
    @track searchValue;
    accounts = [];
    columns = columns;
    showTable = false;
    noRecords = false;
    searchDataChange(event) {
        this.searchValue = event.target.value;
    }
    connectedCallback() {
        listofRecords().then(result => {
            this.accounts = result;
            console.log('OUTPUT : ', JSON.stringify(this.accounts));
            if (this.accounts.length == 0) {
                this.noRecords = true;
                this.showTable = false;
            } else {
                this.showTable = true;
                this.noRecords = false;
                this.showSpinner = false;

            }
        }).catch(error => {
            console.log('Error--->', error);
        })
    }
    serachDataClick() {
        listofData({ name: this.searchValue }).then(result => {
            this.accounts = result;
            this.value = 'Search Records';
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
    handleRowAction(event) {
        const recId = event.detail.row.Id;
        if (recId) {
            let url = 'https://cloudanalogycom-2dd-dev-ed.lightning.force.com/lightning/r/Job_Application__c/' + recId + '/view';
            window.open(url);
        }
    }
}