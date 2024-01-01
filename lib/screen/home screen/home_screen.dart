import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int hour = 0;
  int min = 0;
  int sec = 0;
  int date = 0;
  int mon = 0;
  int year = 0;
  bool digital = true;
  bool analog = false;
  Color theme = Colors.white;
  Color theme2 = Colors.black;
  bool theme1 = true;
  bool strap = false;
  String am = " ";

  void time() {
    hour = DateTime.now().hour;
    if (hour > 12) {
      hour = hour - 12;
      am = "PM";
    } else {
      am = "AM";
    }
    min = DateTime.now().minute;
    sec = DateTime.now().second;
    date = DateTime.now().day;
    mon = DateTime.now().month;
    year = DateTime.now().year;
    Future.delayed(
      const Duration(seconds: 1),
      () => time(),
    );
    setState(() {});
  }

  Widget divider(
      {required int s1,
      required int timev,
      required double thik,
      required Color colors,
      required double ind,
      required double end,
      required double an}) {
    return Transform.rotate(
      angle: pi / an,
      child: Transform.rotate(
        angle: 2 * pi * s1 / timev,
        child: Divider(
          thickness: thik,
          endIndent: MediaQuery.sizeOf(context).width * end,
          indent: MediaQuery.sizeOf(context).width * ind,
          color: colors,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    time();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme1 ? theme2 : theme,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          centerTitle: true,
          title: const Text(
            "clock app",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Visibility(
            visible: digital,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: const Color(0xff250000),
                          child: Center(
                            child: Text(
                              "$hour:",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 70,
                                  color: Color(0xffEA080B)),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          color: const Color(0xff250000),
                          child: Center(
                            child: Text(
                              "$min:",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 70,
                                  color: Color(0xffEA080B)),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          color: const Color(0xff250000),
                          child: Center(
                            child: Text(
                              "$sec",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 70,
                                  color: Color(0xffEA080B)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    color: const Color(0xff250000),
                    child: Center(
                      child: Text(
                        am,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 50,
                            color: Color(0xffEA080B)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          color: const Color(0xff250000),
                          child: Center(
                            child: Text(
                              "$date",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 30,
                                  color: Color(0xffEA080B)),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: const Color(0xff250000),
                          child: Center(
                            child: Text(
                              "$mon",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 30,
                                  color: Color(0xffEA080B)),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          color: const Color(0xff250000),
                          child: Center(
                            child: Text(
                              "$year",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 30,
                                  color: Color(0xffEA080B)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: analog,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: List.generate(
                          60,
                          (index) => Container(
                                child: Stack(
                                  children: [
                                    Transform.rotate(
                                      angle: (pi * 2) * index / 60,
                                      child: Transform.rotate(
                                        angle: pi / 2,
                                        child: Divider(
                                          thickness: 2,
                                          endIndent: index % 5 == 0
                                              ? MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.87
                                              : MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.90,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ),
                ),
                divider(
                    colors: Colors.orange.withOpacity(1),
                    s1: sec,
                    timev: 60,
                    thik: 3,
                    ind: 0.25,
                    end: 0.48,
                    an: 2),
                divider(
                    s1: min,
                    timev: 60,
                    thik: 4,
                    colors: Colors.red.withOpacity(1),
                    ind: 0.32,
                    end: 0.48,
                    an: 2),
                divider(
                    s1: hour,
                    timev: 12,
                    thik: 5,
                    colors: Colors.yellow.withOpacity(1),
                    ind: 0.35,
                    end: 0.48,
                    an: 2)
              ],
            ),
          ),
          Visibility(
            visible: strap,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Text(
                    "🇮🇳",
                    style: TextStyle(fontSize: 30),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    child: CircularProgressIndicator(
                      color: Colors.green.shade400,
                      backgroundColor: Colors.black87,
                      value: sec / 60,
                      strokeWidth: 50,
                    ),
                  ),
                  Container(
                    height: 250,
                    width: 250,
                    child: CircularProgressIndicator(
                      color: Colors.white54,
                      backgroundColor: Colors.black87,
                      value: min / 60,
                      strokeWidth: 70,
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    child: CircularProgressIndicator(
                      color: Colors.orange.shade400,
                      backgroundColor: Colors.black87,
                      value: hour / 12,
                      strokeWidth: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.facebook_rounded,
                color: Color(0xff686868),
                size: 70,
              ),
              Icon(
                Icons.apple,
                color: Color(0xff686868),
                size: 70,
              ),
              Icon(
                Icons.watch,
                color: Color(0xff686868),
                size: 70,
              )
            ],
          ),
        ]),
        drawer: Drawer(
          backgroundColor: theme1 ? theme2 : theme,
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          theme1 = !theme1;
                        });
                      },
                      label: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.dark_mode),
                          Text("Change Theme"),
                        ],
                      ),
                      backgroundColor: Colors.yellow,
                      shape: ShapeBorder.lerp(const OutlineInputBorder(),
                          LinearBorder.none, MediaQuery.sizeOf(context).width),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          digital = !digital;
                        });
                      },
                      label: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.alarm),
                          Text("Digital Clock"),
                        ],
                      ),
                      backgroundColor: Colors.yellow,
                      shape: ShapeBorder.lerp(const OutlineInputBorder(),
                          LinearBorder.none, MediaQuery.sizeOf(context).width),
                    ),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        analog = !analog;
                      });
                    },
                    label: const Text("🕰️ Analog Clock"),
                    backgroundColor: Colors.yellow,
                    shape: ShapeBorder.lerp(const OutlineInputBorder(),
                        LinearBorder.none, MediaQuery.sizeOf(context).width),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        strap = !strap;
                      });
                    },
                    label: const Text("🕰️  Strap watch"),
                    backgroundColor: Colors.yellow,
                    shape: ShapeBorder.lerp(const OutlineInputBorder(),
                        LinearBorder.none, MediaQuery.sizeOf(context).width),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
