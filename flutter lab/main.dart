
import 'package:flutter/material.dart';

void main() {
  runApp(MyWeatherApp());
}

class MyWeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        drawer: WeatherDrawer(),
        body: Center(
          child: WeatherInformation(),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.refresh,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class WeatherInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String currentTemperature = '25°C';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Current Temperature: ",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        Text(
          currentTemperature,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 20.0),
        Image.asset(
          'assets/images/1.webp',
          width: 100.0,
          height: 100.0,
        ),
        SizedBox(height: 10.0),
        Icon(
          Icons.cloud,
          size: 50.0,
          color: Color.fromARGB(255, 90, 99, 104),
        ),
      ],
    );
  }
}

class WeatherDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Weather App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle the Home menu item tap here.
            },
          ),
          // Add more ListTile items for other menu options.
        ],
      ),
    );
  }
}
