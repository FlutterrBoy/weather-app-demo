import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/reuseable/card_weather.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String? cityName;

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =
        Provider.of<WeatherProvider>(context).weatherData;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/clouds.jpg"),
              opacity: 1,
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info_outline_rounded,
                      size: 20,
                    )),
              ),
            ],
            //
            //

            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                ),
                Text(
                  weatherData!.countryName,
                  style: GoogleFonts.montserrat(fontSize: 16),
                ),
              ],
            ),
            //
            //
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.search,
                  size: 20,
                )),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: cardWeather(
                  countryName: weatherData.countryName,
                  date: weatherData.date,
                  avgTemp: weatherData.avgTemp,
                  maxTemp: weatherData.maxTemp,
                  minTemp: weatherData.minTemp,
                  weatherState: weatherData.weatherState,
                  icon: weatherData.icon,
                ),
              )
            ],
          )),
    );
  }
}
