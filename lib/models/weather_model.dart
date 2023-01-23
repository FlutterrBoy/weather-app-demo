class WeatherModel {
  String countryName;
  String date;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String icon;

  WeatherModel({
    required this.countryName,
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.icon,
  });

  factory WeatherModel.fromjson(dynamic data) {
    var forcast = data['forecast']['forecastday'][0]['day'];
    //

    return WeatherModel(
      countryName: data['location']['name'],
      date: data['location']['localtime'],
      avgTemp: forcast['avgtemp_c'],
      maxTemp: forcast['maxtemp_c'],
      minTemp: forcast['mintemp_c'],
      weatherState: forcast['condition']['text'],
      icon: forcast['condition']['icon'],
    );
  }

  @override
  String toString() {
    return "Country : $countryName ,, Date : $date ,, AvgT : $avgTemp ,, MinT : $minTemp ,, MaxT : $maxTemp ,, State : $weatherState ";
  }
}
