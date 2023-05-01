import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class WebToLead extends LightningElement {
    handleSubmit(event) {
        event.preventDefault();

        // Get form data
        const formData = new FormData(event.target);

        // Convert form data to object
        const leadData = {};
        for (const [key, value] of formData.entries()) {
            leadData[key] = value;
        }

        // Submit data to Salesforce
        const url = 'https://webto.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8';
        const params = new URLSearchParams();
        params.append('oid', '00D5j000009nJ1w');
        params.append('retURL', 'http://google.com');
        for (const [key, value] of Object.entries(leadData)) {
            params.append(key, value);
        }
        fetch(url, { method: 'POST', body: params })
            .then(() => {
                // Show success toast
                const toastEvent = new ShowToastEvent({
                    title: 'Success',
                    message: 'Lead submitted successfully.',
                    variant: 'success',
                });
                this.dispatchEvent(toastEvent);

                // Clear form
                event.target.reset();
            })
            .catch((error) => {
                // Show error toast
                const toastEvent = new ShowToastEvent({
                    title: 'Error',
                    message: error.message,
                    variant: 'error',
                });
                this.dispatchEvent(toastEvent);
            });
    }

}