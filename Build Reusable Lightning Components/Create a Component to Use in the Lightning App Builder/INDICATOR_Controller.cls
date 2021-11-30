public class INDICATOR_Controller {
    @AuraEnabled
    public static String getSObjectLabel(String sObjName){
        String label = Schema.getGlobalDescribe().get(sObjName).getDescribe().getLabel();
        return label;
    }
}