const EnvironmentFlavours currentEnvironment = EnvironmentFlavours.development;

class ApiLinks {
  static void init({
    required EnvironmentFlavours environment,
  }) {
    if (environment == EnvironmentFlavours.development) {
      baseURL = _developmentURL;
      baseURLImage = _developmentImageURL;
    } else if (environment == EnvironmentFlavours.production) {
      baseURL = _productionURL;
      baseURLImage = _productionImageURL;
    } else if (environment == EnvironmentFlavours.local) {
      baseURL = _localURL;
      baseURLImage = _localImageURL;
    }
  }

  //base URL
  //test base URL
  static late final String baseURL;
  static late final String baseURLImage;

  static const String _developmentURL = "https://www.googleapis.com/calendar/v3";
  static const String _productionURL = 'https://www.googleapis.com/calendar/v3';
  static const String _localURL = '';

  //test base Image URL
  static const String _developmentImageURL = "";
  static const String _productionImageURL = '';
  static const String _localImageURL = '';

  static const String getCalanderList = "/users/me/calendarList";
  static const String createEvent = "/calendars";

}

enum EnvironmentFlavours {
  development, //for developers
  production,
  local,
}
