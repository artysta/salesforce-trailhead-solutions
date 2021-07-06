public class ParkLocator {
    public static String[] country(String country){
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        String[] parkNames = parks.byCountry(country);
        return parkNames;
    }
}