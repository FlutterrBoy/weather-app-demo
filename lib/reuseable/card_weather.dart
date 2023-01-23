import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cardWeather extends StatefulWidget {
  cardWeather({
    super.key,
    required this.countryName,
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
  });

  String countryName;
  String date;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherState;

  @override
  State<cardWeather> createState() => _cardWeatherState();
}

class _cardWeatherState extends State<cardWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 370,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(144, 255, 255, 255)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            widget.countryName,
            style: GoogleFonts.montserrat(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            widget.date,
            style: GoogleFonts.montserrat(fontSize: 13),
          ),
        ),

        //
        //
        const SizedBox(height: 23),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Text(
                "${widget.avgTemp.toInt()}",
                style: GoogleFonts.montserrat(fontSize: 70),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Icon(Icons.cloud),
            ),
            //
            //
          ],
        ),

        //
        ///
        //
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(widget.weatherState),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                children: [
                  Text("Max temp : ${widget.maxTemp}"),
                  const SizedBox(height: 5),
                  Text("Min temp : ${widget.minTemp}")
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
