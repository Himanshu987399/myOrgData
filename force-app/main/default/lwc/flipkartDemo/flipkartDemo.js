import { LightningElement } from 'lwc';
//import callApex from '@salesforce/apex/CustomSorter.getExpose';
import grocery_resource from '@salesforce/resourceUrl/grocery';
//const API_URL = 'https://getaccounts-8ye202.5sc6y6-3.usa-e2.cloudhub.io/accounts';
export default class FlipkartDemo extends LightningElement {
    grocery=grocery_resource;
  /*  todos = [];

    connectedCallback() {
        callApex().then(result => {
                console.log('fffffffff->'+result);
                this.todos = result;
            })
            .catch(error => {
                this.todos = error;
            });   
    }

    fetchData() {
        fetch(API_URL)
            .then(response => response.json())
            .then(data => {
                this.todos = data;
            })
            .catch(error => {
                console.error(error);
            });
    }*/
}