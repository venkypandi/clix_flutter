import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterdemo/pages/update_mobile_dialog.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 2,
        title: Text(
          "MY PROFILE",
          style: TextStyle(
              color: Colors.pinkAccent,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 85,
                      child: CircleAvatar(
                        backgroundColor: Colors.black12,
                        radius: 80,
                        child: CircleAvatar(
                            radius: 75,
                            foregroundImage: AssetImage("assets/images/profile.jpeg"),
                            backgroundColor: Colors.white,
                        )
                      ),
                    ),
                    Positioned(
                      top: 135,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 15,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Text(
                  "Venkatesh Pandian",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 8,
                      width: 30,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Personal Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Icon(
                        FontAwesome5.id_card,
                        color: Colors.pinkAccent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Customer ID:",
                          style: TextStyle(
                            color: Colors.pinkAccent,
                          ),
                          children: [
                            TextSpan(
                              text: "100000045140"
                            )
                          ]
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                  text: "First Name\n",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "Venkatesh",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                  text: "Last Name\n",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "Pandian",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                  text: "PAN\n",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "ATNNG4785F",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                  text: "Email ID",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.edit,
                                        size:15,
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\nsvenkateshpandian@gmail.com",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                  text: "Current Address",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.edit,
                                        size:15,
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n830 E1/6, Rajiv Nagar,EB Colony,\nKovilpatti,Tuticorin",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                  text: "Middle Name\n",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "-",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: (){
                                showDialog(context: context,
                                    builder:(context) => UpdateMobile());
                              },
                              child: RichText(
                                text: TextSpan(
                                    text: "Mobile Number",
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.edit,
                                          size:15,
                                        ),
                                      ),
                                      TextSpan(
                                          text: "\n8248663588",
                                          style: TextStyle(
                                            color: Colors.black,
                                          )
                                      )
                                    ]
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RichText(
                              text: TextSpan(
                                  text: "Date of Birth",
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "\n28th May,1996",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              ),
                            ),
                          )

                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


