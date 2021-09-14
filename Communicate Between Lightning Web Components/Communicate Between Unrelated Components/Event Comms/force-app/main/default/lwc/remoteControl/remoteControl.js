import { LightningElement, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import COUNT_UPDATED_CHANNEL from '@salesforce/messageChannel/Count_Updated__c';
export default class RemoteControl extends LightningElement {
    @wire(MessageContext)
    messageContext;

    handleIncrement() {
        // this.counter++;
        const payload = {
            operator: 'add',
            constant: 1
        };
        publish(this.messageContext, COUNT_UPDATED_CHANNEL, payload);
    }

    handleDecrement() {
        // this.counter--;
        const payload = {
            operator: 'subtract',
            constant: 1
        };
        publish(this.messageContext, COUNT_UPDATED_CHANNEL, payload);
    }
    
    handleMultiply(event) {
        const factor = event.detail;
        // this.counter *= factor;
        const payload = {
            operator: 'multiply',
            constant: factor
        };
        publish(this.messageContext, COUNT_UPDATED_CHANNEL, payload);
    }
}