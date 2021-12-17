// import 'package:hello_world_2/data/weather.dart';

// class Forecast {
//   final List <Weather> daily;
//   // double temperature = 0;
//   // String icon = '';

//   Forecast(
//     {this.daily: const[]}
//   );
//   //get the forecast for the next 3 days, excluding current day
//   // fiveDayWeather({this.list});
//   bool hasDaily = json['daily'] != null;
//   var tempDaily = [];
//   if (hasDaily) {
//     List items = json['daily'];
//           .map((item) => Weather.fromDailyJson(item))
//           .toList()
//           .skip(1)
//           .take(3)
//           .toList();
//   }

//   return Forecast(
//     daily: tempDaily
//   )

// }
