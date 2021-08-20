public with sharing class CreateContactFromCan {
    //Declare a method that returns void and accepts a Candidate list named candsFromTrigger
    public void createContact (List<Candidate__c> candsFromTrigger) {
        //Instantiate a Contact list named conList
        List<Contact> conList = new List<Contact>();
        //Declare a list FOR loop that uses an iteration variable named currentCandidate
        //to loop through the candsFromTrigger list
        for (Candidate__c currentCandidate:candsFromTrigger) {
        
        }
    }
}