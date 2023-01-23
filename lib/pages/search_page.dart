import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/home_screen.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg2.png"),
              opacity: 0.7,
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "WeatherApp",
            style: GoogleFonts.montserrat(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 100),
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Image.asset('assets/sun.png'),
                ),
                //
                const SizedBox(height: 20),

                //
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Discover the Weather",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: const Color(0xffE2EAF3),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "in Your City",
                    style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: const Color(0xffE2EAF3),
                    ),
                  ),
                ),
                //
                const SizedBox(height: 15),

                //
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Get to know your weather",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),

                //
                //
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Center(
                    child: SizedBox(
                      width: 370,
                      child: TextField(
                        onSubmitted: (data) async {
                          cityName = data;
                          WeatherService service = WeatherService();

                          WeatherModel weather =
                              await service.getWeather(cityName: cityName!);
                          Provider.of<WeatherProvider>(context, listen: false)
                              .weatherData = weather;

                          print(weather);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                          setState(() {});
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                        ],
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search),
                          hintText: "Enter City Name",
                          hintStyle: GoogleFonts.montserrat(fontSize: 16),
                          filled: true,
                          fillColor: const Color.fromARGB(164, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                                width: 1.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(141, 0, 153, 255)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //
                //
                const SizedBox(height: 100),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Made by ",
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: const Color(0xffE2EAF3),
                        ),
                      ),
                      Text(
                        "FlutterBoy",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: const Color(0xffE2EAF3),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
