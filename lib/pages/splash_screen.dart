import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherData == null
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff2F3643),

                      Color.fromARGB(255, 39, 49, 68),
                      //add more colors for gradient
                    ],
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.bottomRight, //end of the gradient color
                    stops: [0, 0.8] //stops for individual color

                    ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 270,
                      width: 270,
                      child: Image.asset('assets/sun.png'),
                    ),
                    //
                    const SizedBox(height: 100),
                    //
                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text("Discover the Weather",
                          style: TextStyle(
                              color: Color(0xffE2EAF3), fontSize: 30)),
                    ),

                    const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text("in Your City",
                          style: TextStyle(
                              color: Color(0xffE2EAF3), fontSize: 30)),
                    ),
                    //
                    const SizedBox(height: 5),
                    //
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Get to know your weather",
                        style: TextStyle(
                          color: Color.fromARGB(158, 226, 234, 243),
                        ),
                      ),
                    ),

                    //
                    const SizedBox(height: 30),
                    //

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => SearchPage())));
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                // Change your radius here
                                borderRadius: BorderRadius.circular(13),
                              ),
                            )),
                            child: const Text("Get Started",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15))),
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(),
    );
  }
}
