// import 'package:hello_world_2/data/weather.dart';
import '../data/weather.dart';
// import '../data/forecast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  // var currentweatherapiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=' + citySearched + '&appid=' + apiKey;

  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'be12c130488a49e9f35617a382464679';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> paramaters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, paramaters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);

    return weather;
  }
}

// class FiveDayHttpHelper {
//   final String authority = 'api.openweathermap.org';
//   final String path = 'data/2.5/forecast';
//   final String apiKey = 'be12c130488a49e9f35617a382464679';

//   Future<fiveDayWeather> getfiveDayWeather(String location) async {
//     Map<String, dynamic> paramaters = {'q': location, 'appId': apiKey};
//     Uri uri = Uri.https(authority, path, paramaters);
//     http.Response fivedayresult = await http.get(uri);
//     Map<String, dynamic> data = json.decode(fivedayresult.body);
//     fiveDayWeather forecast = fiveDayWeather.fromJson(data);

//     return forecast;
//   }
// }
