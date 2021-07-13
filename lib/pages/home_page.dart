import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/widgets/drawer.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/utils.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  CarouselController buttonCarouselController = CarouselController();
}

class _HomePageState extends State<HomePage> {
  final String name = "Venkatesh";
  double _randomScore = 301;
  int _current = 0;

  String percentageModifier(double value) {
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: Image.asset("assets/images/clixlogo.png",fit: BoxFit.scaleDown,),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(
              Icons.notifications_none_outlined
            ),
          )
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Mr. Venkatesh",
                  textScaleFactor: 1.2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/money.png"),
                        scale: 0.5,
                        colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.08), BlendMode.dstATop),
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  "My Loans",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20,right: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                        text:TextSpan(
                                            text: "EMI Due",
                                            style: TextStyle(
                                                color: Colors.grey
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(text: "\nin 1 day",style: TextStyle(color: Colors.pinkAccent))
                                            ]
                                        )
                                    ),
                                    RichText(
                                        text:TextSpan(
                                            text: "1",
                                            style: TextStyle(
                                              fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(1000, 72, 103, 170)
                                            ),
                                            children:[
                                              WidgetSpan(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(bottom: 35.0),
                                                  child: Icon(Typicons.warning_empty,size: 10,color: Colors.pinkAccent,),
                                                ),
                                              ),
                                            ]
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Icon(
                                    FontAwesome.bank,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: Center(
                                  child: Text(
                                    "Pay Now",
                                    textScaleFactor: 1.2,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.pinkAccent
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(height: 150, child: VerticalDivider(color: Colors.grey)),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0,bottom: 20),
                                child: Text(
                                  "Personal Loan",
                                  textScaleFactor: 1.1,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5,bottom: 20),
                                child: RichText(
                                    text:TextSpan(
                                        text: "Loan ID",
                                        style: TextStyle(
                                            color: Colors.grey
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: "\nSGHU34BBDE23",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                                        ]
                                    )
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0,bottom: 20),
                                child: RichText(
                                    text:TextSpan(
                                        text: "Total Amount",
                                        style: TextStyle(
                                            color: Colors.grey
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: "\n₹1,50,000",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                                        ]
                                    )
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: RichText(
                                  text: TextSpan(
                                      text: "View All",
                                      style: TextStyle(
                                          color: Colors.blueAccent
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                            child: Icon(FontAwesome.right_open,size: 15,color: Colors.blueAccent,),
                                          ),
                                        ),
                                      ]
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
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 2,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "EXCELLENT",
                                  textScaleFactor: 1.3,
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "Check your free Credit\nScore to get Best Offers",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: RichText(
                                  text: TextSpan(
                                    text: "Score as on ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    children: [
                                      TextSpan(text: "10th July,2021",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold))
                                    ]
                                  )

                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Powered By ",
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: Image.asset("assets/images/experian.png",
                                          scale: 25,)
                                        )
                                      ]
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0,top: 10,right: 10),
                                child: SleekCircularSlider(
                                  appearance: CircularSliderAppearance(
                                    customColors: CustomSliderColors(
                                      trackColor: Colors.grey,
                                      progressBarColors: [Colors.green,Colors.yellow,Colors.red,],
                                    ),
                                    infoProperties: InfoProperties(
                                      mainLabelStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                      ),
                                      modifier:percentageModifier
                                    ),
                                      customWidths: CustomSliderWidths(progressBarWidth: 10)
                                  ),
                                  initialValue: 850,
                                  min: 300,
                                  max: 900,

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.pinkAccent,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      _randomScore = (Random().nextInt(900) + 301).toDouble();
                                    });
                                  },
                                  child: Text(
                                    "Check Your Score"
                                  ),
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/moneybagc.jpg"),
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,top: 15,right: 15,bottom: 20),
                          child: Align(child: Image.asset("assets/images/speedylogo.png"),alignment: Alignment.centerLeft,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Money in your bank in minutes",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Zero Paperwork | Instant Decisioning\nOnline Verification",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20,top: 10,bottom: 5),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pinkAccent,
                              ),
                              onPressed: (){

                              },
                              child: Text(
                                  "Apply Now"
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset("assets/images/beach.jpg")
                    ),
                    Positioned(
                      top: 10,
                      child: Text(
                        "Personal Loan for Travel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      child: Text(
                        "Don't let lack of money dampen your wander-\nlust. Take that solo vacation, family holiday",
                        style: TextStyle(
                            color: Colors.white
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        color: Colors.pinkAccent,
                        width: 130,
                        height: 20,
                        child: Text("Pre Approved*",textAlign:TextAlign.center,style: TextStyle(color: Colors.white),),
                      ) ,
                    )

                  ],
                ),
              )

            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: ClixDrawer(),
    );
  }
}
