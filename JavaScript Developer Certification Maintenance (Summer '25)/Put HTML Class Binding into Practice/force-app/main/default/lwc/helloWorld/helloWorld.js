import { LightningElement, api } from "lwc";

export default class extends LightningElement {
  @api objectApiName;

  get computedClassNames() {
    return ["slds-box", "slds-theme_alert-texture", this.objectApiName === 'Account' ? "slds-theme_shade" : "slds-theme_success"];
  }
}