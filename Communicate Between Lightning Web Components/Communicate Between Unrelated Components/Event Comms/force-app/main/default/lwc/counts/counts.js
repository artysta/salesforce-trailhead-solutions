import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import COUNT_UPDATED_CHANNEL from '@salesforce/messageChannel/Count_Updated__c';
export default class Counts extends LightningElement {
    subscription = null;
    priorCount = 0;
    counter = 0;
    @wire(MessageContext)
    messageContext;

    subscribeToMessageChannel() {
        this.subscription = subscribe(
            this.messageContext,
            COUNT_UPDATED_CHANNEL,
            (message) => this.handleMessage(message)
        );
    }

    handleMessage(message) {
        this.priorCount = this.counter;
        if (message.operator == 'add') {
            this.counter += message.constant;
        } else if (message.operator == 'subtract') {
            this.counter -= message.constant;
        } else {
            this.counter *= message.constant;
        }
    }

    connectedCallback() {
        this.subscribeToMessageChannel();
    }
}