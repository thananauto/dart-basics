import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:meta/meta.dart';
import 'package:dart_basics/weather_cod/weather.dart';

class WeatherApiClient {
final http.Client httpClient;
static const baseUrl = 'https://www.metaweather.com';

WeatherApiClient({@required this.httpClient }): assert(httpClient!=null);

Future<int> getLocationId(String city) async{
  final locationUrl= '$baseUrl/api/location/search/?query=$city';
  final locationResponse = await httpClient.get(locationUrl);

  if(locationResponse.statusCode != 200){
      throw Exception("Service is not up and running");
  }

  final locationJson = json.decode(locationResponse.body) as List;

  return locationJson.first['woeid'];

}

Future<Weather> fetchWeather(int locationId) async{

  final weatherUrl = '$baseUrl/api/location/$locationId';
  final weatherResponse = await httpClient.get(weatherUrl);

  if(weatherResponse.statusCode != 200){
    throw Exception('Fetching weather throwing the exception');
  }


  Map<String, dynamic> value = json.decode(weatherResponse.body)  ;

  List<dynamic> output = List<dynamic>();

  //value.forEach((key, value) => print('${key} ---> ${value}'));
    //return value;
 // print(value);
  //return output;

  return Weather.fromJson(value);
}


}
main() async{
  WeatherApiClient weatherApiClient = WeatherApiClient(httpClient: http.Client());
//int value = await weatherApiClient.getLocationId('chennai');

Weather _weather = await weatherApiClient.fetchWeather(2295424);





  print(_weather);
}