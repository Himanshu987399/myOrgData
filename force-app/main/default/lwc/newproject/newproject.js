import { LightningElement } from 'lwc';
import getAccount from '@salesforce/apex/newproject.getAccount';
export default class Newproject extends LightningElement {
    allData;
    show = false;
    selectedAccount;
    allContactOption = [];
    allOpportunityOption =[];
    selectedContact;
    selectedOpportunity;
    connectedCallback() {
        getAccount().then(result => {
            this.allData = result;
            console.log('AllData-->' + JSON.stringify(result));
        }).catch(error => {
            console.log('Erro-->' + error);
        });
    }
    get allAccountOption() {
        let allAccount = [];
        if (this.allData) {
            for (let key in this.allData) {
                if (this.allData.hasOwnProperty(key)) {
                    allAccount.push({
                        label: this.allData[key].Name,
                        value: this.allData[key].Id
                    });
                }
            }
        }
        return allAccount;
    }
    handleChangeOfContact(event){
        this.selectedContact = event.target.value;
    }
    handleChangeOfOpportunity(event){
        this.selectedOpportunity = event.target.value;
    }
    handleChange(event) {
        this.selectedAccount = event.target.value;
        this.allContactOption = [];
        this.allOpportunityOption =[];
        this.allContactOption.push({
            label : '--None--',
            value :''
        })
        this.allOpportunityOption.push({
            label : '--None--',
            value :''
        })
        if (this.selectedAccount) {
            this.show = true;
            for (let key in this.allData) {
                if (this.allData[key].Id === this.selectedAccount) {
                    if (this.allData[key].Contacts) {
                        for (let key2 in this.allData[key].Contacts) {
                            let contact = this.allData[key].Contacts;
                            this.allContactOption.push({
                                label: contact[key2].Name,
                                value: contact[key2].Id
                            })
                        }
                    }
                    if (this.allData[key].Opportunities) {
                        for (let key2 in this.allData[key].Opportunities) {
                            let OppList = this.allData[key].Opportunities;
                            this.allOpportunityOption.push({
                                label: OppList[key2].Name,
                                value: OppList[key2].Id
                            })
                        }
                    }
                }

            }
        }
    }
}