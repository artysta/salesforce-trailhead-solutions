public class INDICATOR_Controller {
    private static SObject sobj;
    @AuraEnabled
    public static String getSObjectLabel(String sObjName){
        String label = Schema.getGlobalDescribe().get(sObjName).getDescribe().getLabel();
        return label;
    }
    @AuraEnabled
    public static List<INDICATOR_Service.Indicator> getIndicators(String recId, String objectName){
        getSObject(recId, objectName);
        if(sobj != NULL){
            List<INDICATOR_Service.Indicator> indicators = INDICATOR_Service.getIndicatorBadgesForObject(sobj);
            return indicators;
        } else {
            return null;
        }
    }
    public static void getSObject(String recId, String objectName){
        List<String> fNames = INDICATOR_Service.getFieldsToQueryForObject(objectName);
        if(fNames.size() > 0){
            String query = 'SELECT Id,'+ String.join(fNames,',')+' FROM '+ objectName +' WHERE Id =\''+ recId +'\' LIMIT 1';
            List<SObject> results = Database.query(query);
            if(results.size() == 1){
                sobj = results[0];
            }
        }
    }
}