import { LightningElement } from 'lwc';

export default class AccountFinder extends LightningElement {
    annualRevenue = null;

    handleChange(event) {
        this.annualRevenue = event.detail.value;
    }

    reset() {
        this.annualRevenue = null;
    }
}