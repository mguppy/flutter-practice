import 'package:flutter/material.dart';
import 'package:hello_world_2/data/weather.dart';
// import 'package:hello_world_2/data/forecast.dart';
import 'package:intl/intl.dart';
import '../data/http_helper.dart';
import '../data/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var date = DateTime.now();
// DateTime date = new DateTime(now.year, now.month, now.day);
String dateFormat = DateFormat('EEEE, MMM d, yyyy').format(date);

const spinkit = SpinKitRotatingCircle(
  color: Colors.blue,
  size: 50.0,
);

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0, '');
  // fiveDayWeather fivedayresult = fiveDayWeather('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Weather - ' + dateFormat)),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(children: [
            Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                    controller: txtPlace,
                    decoration: InputDecoration(
                        hintText: 'Enter a city',
                        suffixIcon: IconButton(
                            icon: Icon(Icons.search), onPressed: getData)))),
            // weatherRow('Place: ', result.name),
            Stack(alignment: Alignment.center, children: <Widget>[
              result.icon == '' ? spinkit : Image.network('https://openweathermap.org/img/wn/${result.icon}@2x.png'),
              // Image.network('https://openweathermap.org/img/wn/${result.icon}@2x.png'),
              // spinkit,
              // FadeInImage(
              //     placeholder: spinkit,
              //     image:
              //         'https://openweathermap.org/img/wn/${result.icon}@2x.png'),
              Text(result.name,
                  style: TextStyle(height: 5, fontSize: 35, color: Colors.blue))
            ]),
            weatherRow('Description: ', result.description),
            weatherRow('Temperature: ', result.temperature.toStringAsFixed(2)),
            weatherRow('Perceived: ', result.perceived.toStringAsFixed(2)),
            weatherRow('Pressure: ', result.pressure.toString()),
            weatherRow('Humidity: ', result.humidity.toString()),

            // weatherRow('Icon: ', fivedayresult.icon)
          ]),
        ));
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    // FiveDayHttpHelper forecastHelper = FiveDayHttpHelper();
    // fivedayresult = await forecastHelper.getfiveDayWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(children: [
          Expanded(
              flex: 3,
              child: Text(label,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).hintColor,
                  ))),
          Expanded(
              flex: 4,
              child: Text(value,
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ))),
        ]));
    return row;
  }
}
