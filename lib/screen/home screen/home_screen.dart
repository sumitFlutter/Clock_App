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
  bool digital = false;
  bool analog= false;
  Color theme=Colors.white;
  Color theme2=Colors.black;
  bool theme1=true;
  bool strap=false;
  void time() {
    hour = DateTime
        .now()
        .hour;
    min = DateTime
        .now()
        .minute;
    sec = DateTime
        .now()
        .second;
    date = DateTime
        .now()
        .day;
    mon = DateTime
        .now()
        .month;
    year = DateTime
        .now()
        .year;
    Future.delayed(
      const Duration(seconds: 1),
          () => time(),
    );
    setState(() {});
  }
  Widget divider({required int s1,required int timev,required double thik,required Color colors,required double ind,required double end ,required double an})
  {
    return  Transform.rotate(
      angle: pi/an,
      child: Transform.rotate(
        angle: 2*pi*s1/timev,
        child: Divider(
          thickness: thik,
          endIndent: MediaQuery.sizeOf(context).width*end,
          indent: MediaQuery.sizeOf(context).width*ind,
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
        backgroundColor: theme1?theme:theme2,
        appBar: AppBar(
          backgroundColor: Colors.black54,
          centerTitle: true,
          title: const Text(
            "clock app",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: digital,
                child: Center(
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.mobile_friendly,
                              color: Colors.red.withOpacity(1),
                            ),
                            Icon(
                              Icons.alarm,
                              color: Colors.blue.withOpacity(1),
                            ),
                            Icon(
                              Icons.alarm_add_sharp,
                              color: Colors.green.withOpacity(1),
                            )
                          ],
                        ),
                        Text(
                          "$hour:$min:$sec",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red.withOpacity(1),
                              fontSize: 40),
                        ),
                        Text(
                          "$date/$mon/$year",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.withOpacity(0.95),
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
                      children: List.generate(60, (index) =>  Container(
                        child: Stack(
                          children: [
                            Transform.rotate(
                              angle: (pi*2)*index/60,
                              child: Transform.rotate(
                                angle: pi/2,
                                child: Divider(thickness: 2,
                                  endIndent:index%5==0?MediaQuery.sizeOf(context).width*0.87: MediaQuery.sizeOf(context).width*0.90,color: Colors.black,
                                  ),
                              ),
                            ),
                          ],
                        ),
                      )
                            ),
                    ),
                  ),
                ),
                divider(colors: Colors.orange.withOpacity(1),s1: sec,timev: 60,thik: 3,ind: 0.25,end: 0.48,an: 2),
                divider(s1: min, timev: 60, thik: 4, colors: Colors.red.withOpacity(1), ind: 0.32, end: 0.48,an: 2),
                divider(s1: hour, timev: 12, thik: 5, colors: Colors.yellow.withOpacity(1), ind: 0.35, end: 0.48, an: 2)
              ],
            ),
          ),
        Visibility(
          visible: strap,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height:55,
                  width: 50,
                  child: const Text("🇮🇳",style: TextStyle(fontSize: 50),),
                ),
              ),
              Center(
                child: Container(
                  height:150,
                  width: 150,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    backgroundColor: Colors.black87,
                    value: sec/60,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height:250,
                  width: 250,
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.black87,
                    value: min/60,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height:350,
                  width: 350,
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                    backgroundColor: Colors.black87,
                    value: hour/12,
                  ),
                ),
              ),
            ],
          ),
        ),

        ]
              ),
        drawer: Drawer(
          backgroundColor: theme1?theme2:theme,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(25),
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              setState(() {
                                theme1=!theme1;
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
                            shape: ShapeBorder.lerp(const OutlineInputBorder(), LinearBorder.none, MediaQuery.sizeOf(context).width),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(25),
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
                            shape: ShapeBorder.lerp(const OutlineInputBorder(), LinearBorder.none, MediaQuery.sizeOf(context).width),
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
                          shape: ShapeBorder.lerp(const OutlineInputBorder(), LinearBorder.none, MediaQuery.sizeOf(context).width),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                        ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            setState(() {
                              strap = !strap;
                            });
                          },
                          label: const Text("🕰️  Strap watch"),
                          backgroundColor: Colors.yellow,
                          shape: ShapeBorder.lerp(const OutlineInputBorder(), LinearBorder.none, MediaQuery.sizeOf(context).width),
                        ),
                      ],
                    ),
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
