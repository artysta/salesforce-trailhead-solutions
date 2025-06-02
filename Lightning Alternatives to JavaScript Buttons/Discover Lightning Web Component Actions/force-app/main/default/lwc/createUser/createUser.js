import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { CloseActionScreenEvent } from 'lightning/actions';
import { createRecord } from 'lightning/uiRecordApi';
import TEST_USER_OBJECT from '@salesforce/schema/Test_User__c';
import NAME_FIELD from '@salesforce/schema/Test_User__c.Name';
import PASSWORD_FIELD from '@salesforce/schema/Test_User__c.Password__c';
import EMAIL_FIELD from '@salesforce/schema/Test_User__c.Email__c';
import NICKNAME_FIELD from '@salesforce/schema/Test_User__c.Nickname__c';
import CASE_STUDY_FIELD from '@salesforce/schema/Test_User__c.Case_Study__c';
export default class CreateUser extends LightningElement {
   @api recordId;
   async handleSave() {
       // query form elements
       const firstNameEl = this.template.querySelector('[data-field="firstName"]');
       const lastNameEl = this.template.querySelector('[data-field="lastName"]');
       const nickNameEl = this.template.querySelector('[data-field="nickName"]');
       const emailEl = this.template.querySelector('[data-field="email"]');
       const passwordEl = this.template.querySelector('[data-field="password"]');
       // check for errors on form elements (custom or otherwise)
       const isFirstNameValid = firstNameEl.reportValidity();
       const isLastNameValid = lastNameEl.reportValidity();
       const isNickNameValid = nickNameEl.reportValidity();
       const isPasswordValid = passwordEl.reportValidity();
       const isEmailValid = emailEl.reportValidity();
       if(!isFirstNameValid || !isLastNameValid || !isNickNameValid || !isPasswordValid || !isEmailValid) {
           return;
       }
       const recordInput = {
           apiName: TEST_USER_OBJECT.objectApiName,
           fields: {
               [NAME_FIELD.fieldApiName]: `${firstNameEl.value} ${lastNameEl.value}`,
               [PASSWORD_FIELD.fieldApiName]: passwordEl.value,
               [EMAIL_FIELD.fieldApiName]: emailEl.value,
               [NICKNAME_FIELD.fieldApiName]: nickNameEl.value,
               [CASE_STUDY_FIELD.fieldApiName]: this.recordId,
           }
       };
       try {
           await createRecord(recordInput);
           this.dispatchEvent(
               new ShowToastEvent({
                   title: 'Success!',
                   message: 'The test user has been created.',
                   variant: 'success'
               })
           );
           this.dispatchEvent(new CloseActionScreenEvent());
       } catch (error) {
           new ShowToastEvent({
               title: 'Error creating the test user, try again...',
               message: error.body.message,
               variant: 'error'
           });
       }
   }
   updateNickName() {
       const firstName = this.template.querySelector('[data-field="firstName"]').value;
       const nickNameEl = this.template.querySelector('[data-field="nickName"]');
       if(firstName && !nickNameEl.value) {
           const today = new Date();
           nickNameEl.value = firstName + today.valueOf(today)
       }
   }
   handleCancel() {
       this.dispatchEvent(new CloseActionScreenEvent());
   }
   handlePasswordBlur() {
       const passwordEl = this.template.querySelector('[data-field="password"]');
       // clear custom errors
       passwordEl.setCustomValidity('');
       this.validatePassword(passwordEl);
   }
   validatePassword(input) {
       // check lightning-input validity
       if(input.reportValidity()) {
           // perform custom validation
           const value = input.value;
           if (value === undefined) {
               input.setCustomValidity('You must enter a password.');
           } else if (value.length < 7) {
               input.setCustomValidity('The password is the wrong length (must be >= 7): ' + value.length);
           } else if (value.length > 15) {
               input.setCustomValidity('The password is the wrong length (must be <= 15): ' + value.length);
           } else if (value.search(/[0-9]+/) === -1) {
               input.setCustomValidity('The password must contain at least one number.');
           } else if (value.search(/[a-zA-Z]+/) === -1) {
               input.setCustomValidity('The password must contain at least one letter.');
           }
           // display custom validation errors (if any)
           input.reportValidity();
       }
   }
   handleEmailBlur() {
       const emailEl = this.template.querySelector('[data-field="email"]');
       // clear Custom Errors
       emailEl.setCustomValidity('');
       this.validateEmail(emailEl);
   }
   validateEmail(input) {
       // check lightning-input validity
       if (input.reportValidity()) {
           const value = input.value;
           if (!/@gmail\.com$/.test(value)) {
               input.setCustomValidity('Email must be a Gmail account.');
           }
           // display custom validation errors (if any)
           input.reportValidity();
       }
   }
}