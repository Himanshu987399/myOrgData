import { LightningElement, track } from 'lwc';
import getOpenAIresponse from '@salesforce/apex/OpenAIApex.getOpenAIresponse';

export default class Chatgpt extends LightningElement {
    @track prompt;
    @track response;
    
    updatePrompt(event) {
        this.prompt = event.target.value;
    }

    clickgetOpenAIresponse() {
        getOpenAIresponse({prompt: this.prompt})
        .then(result => {
            this.response = JSON.parse(result);
            console.log('output--?'+JSON.stringify(this.response));
            this.response = this.response.choices[0].text;
        })
        .catch(error => {
            console.log('error'+JSON.stringify(error))
            this.response = error;
        });
    }
}