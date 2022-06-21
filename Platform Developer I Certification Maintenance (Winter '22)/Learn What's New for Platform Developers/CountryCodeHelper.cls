public class CountryCodeHelper {
    // A new solution to retrieve Custom Metadata record data.
    public static String getCountryCode(String country) {
        return Country_Code__mdt.getInstance(country).Country_Code__c;
    }
    
    /*
	An old solution to retrieve Custom Metadata record data.
    
	public static String getCountryCode(String country) {
        Country_Code__mdt countryCode = [
            SELECT Id, MasterLabel, Country_Code__c
            FROM Country_Code__mdt
            WHERE MasterLabel = :country
            LIMIT 1
        ];
        
        return countryCode.Country_Code__c;
    }
	*/
}