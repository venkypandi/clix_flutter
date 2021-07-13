import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 2,
        title: Text(
          "HELP",
          style: TextStyle(
            color: Colors.pinkAccent,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 10,top: 20),
              child: Text(
                "Contact Us",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: RichText(
                    text: TextSpan(
                      text: "You can reach out to our customer care \nexecutive at ",
                      style: TextStyle(
                        color: Colors.black
                      ),
                      children: [
                        TextSpan(
                          text: "1800 200 9898",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          )
                        )
                      ]
                    ),
                  ),
                ),
                Icon(
                  Icons.headset_mic_outlined,
                  color: Colors.blue,
                  size: 50,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 10,top: 20),
              child: Text(
                "Chat with MAYA",
                textScaleFactor: 1.3,
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "You can raise your queries to MAYA or\nconnect with our live agent"
                  )
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset("assets/images/maya.png"),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 10,top: 20),
              child: Text(
                "Whatsapp",
                textScaleFactor: 1.3,
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                        "We are also available on Whatsapp to\nsolve your queries 24*7"
                    )
                ),
                Icon(
                  FontAwesome5.whatsapp,
                  color: Colors.green,
                  size: 50,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 10,top: 20),
              child: Text(
                "Email Us",
                textScaleFactor: 1.3,
                style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                        "You can write to our customer care\nexecutive at hello@clix.capital"
                    )
                ),
                Icon(
                  FontAwesome.mail,
                  color: Colors.purple,
                  size: 50,
                )
              ],
            )
            ,
            Padding(
              padding: const EdgeInsets.only(left: 20.0,bottom: 10,top: 20),
              child: Text(
                "Visit Us",
                textScaleFactor: 1.3,
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                        "You can meet our customer careor\nexecutive at our office address:"
                    )
                ),
                Icon(
                  FontAwesome5.map_marker_alt,
                  color: Colors.pinkAccent,
                  size: 50,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Corporate Address:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                      children: [
                        TextSpan(
                          text: " 901b, 9th Floor,\nTwo Horizon Centre, DLF Phase V,\nGurgaon, Haryana, India – 122002",
                          style: TextStyle(
                            fontWeight: FontWeight.normal
                          )
                        )
                      ]
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Registered Address:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                        children: [
                          TextSpan(
                              text: "4th Floor, Kailash\nBuilding, Kasturba Gandhi Marg,\nConnaught Place, New Delhi-110001",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal
                              )
                          )
                        ]
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
