import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class cardWeather extends StatefulWidget {
  cardWeather(
      {super.key,
      required this.countryName,
      required this.date,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState,
      required this.icon});

  String countryName;
  String date;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String icon;

  @override
  State<cardWeather> createState() => _cardWeatherState();
}

class _cardWeatherState extends State<cardWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(185, 0, 0, 0),
              blurRadius: 20,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Image.network(
                widget.icon,
                errorBuilder: (context, exception, stackTrace) {
                  return const Icon(
                    Icons.cloud,
                    size: 65,
                  );
                },
              ),
            ),
            //
            //
          ],
        ),

        //
        ///
        //
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                widget.weatherState,
                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.normal),
              ),
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
        ),

        const SizedBox(height: 25),
      ]),
    );
  }
}
