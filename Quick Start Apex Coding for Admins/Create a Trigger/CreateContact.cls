trigger CreateContact on Candidate__c (after insert) {
    /* Invoke the createContact method with a list of Candidates as the argument
    to create a corresponding Contact from each new Candidate Record */
    CreateContactFromCan.createContact(Trigger.new);
}