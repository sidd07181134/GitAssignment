import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  final TextEditingController _cityController = TextEditingController();
  String city = '';
  String weatherCondition = '';
  int temperature = 0;

  void _fetchWeather() {
    setState(() {
      city = _cityController.text;
      Random random = Random();
      temperature = 15 + random.nextInt(15); // Random temperature 15°C-30°C
      weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][random.nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'Enter city name'),
            ),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text('City: $city', style: TextStyle(fontSize: 24)),
            Text('Temperature: $temperature°C', style: TextStyle(fontSize: 24)),
            Text('Condition: $weatherCondition', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
