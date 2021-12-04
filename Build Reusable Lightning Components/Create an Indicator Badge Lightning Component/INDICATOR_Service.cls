public class INDICATOR_Service {
    public static List<String> getFieldsToQueryForObject(String objName){
        Set<String> targetFields = new Set<String>();
        for(Indicator_Badge__mdt i: [SELECT Related_Field__r.QualifiedApiName FROM Indicator_Badge__mdt WHERE Object__r.QualifiedApiName = :objName]){
            targetFields.add(i.Related_Field__r.QualifiedApiName);
        }
        return new List<String>(targetFields);
    }
    public static List<Indicator> getIndicatorBadgesForObject(SObject sobj){
        List<Indicator> recordIndicators = new List<Indicator>();
        for(Indicator_Badge__mdt indicator: [SELECT MasterLabel, Badge_Color__c, Comparison_Value__c, Comparison_Type__c, Badge_Icon_Name__c, Related_Field__r.QualifiedApiName FROM Indicator_Badge__mdt WHERE Object__r.QualifiedApiName = :sobj.getSObjectType().getDescribe().getName()]){
            recordIndicators.add(evaluateIndicator(indicator, sobj));
        }
        return recordIndicators;
    }
    private static Indicator evaluateIndicator(Indicator_Badge__mdt i, SObject sobj){
        Object field = sobj.get(i.Related_Field__r.QualifiedApiName);
        Boolean isEnabled = false;
        if(i.Comparison_Type__c == 'Use Boolean Value of Field'){
            isEnabled = (Boolean)field;
        } else if(i.Comparison_Type__c == 'Contains'){
            isEnabled = (String.valueOf(field)).contains(i.Comparison_Value__c);
        } else if(i.Comparison_Type__c == 'Not Blank or Null'){
            isEnabled = String.isNotBlank(String.valueOf(field));
        } else if(i.Comparison_Type__c == 'Blank or Null'){
            isEnabled = String.isBlank(String.valueOf(field));
        } else if(i.Comparison_Type__c == 'Greater or Equal'){
            isEnabled = (Decimal)field >= Decimal.valueOf(i.Comparison_Value__c);
        } else if(i.Comparison_Type__c == 'Less or Equal'){
            isEnabled = (Decimal)field <= Decimal.valueOf(i.Comparison_Value__c);
        }
        if(isEnabled){
            return new Indicator(i.Badge_Icon_Name__c, i.Badge_Color__c, i.MasterLabel);
        } else {
            return null;
        }
    }
    //inner class, creating our 'Indicator' object and attributes
    public class Indicator{
        //first, the attributes:
        @AuraEnabled
        public String icon {get; set;}
        @AuraEnabled
        public String color {get; set;}
        @AuraEnabled
        public String label {get; set;}
        //then, our object:
        public Indicator(String icon, String color, String label){
            this.icon = icon;
            this.color = color;
            this.label = label;
        }
    }
}