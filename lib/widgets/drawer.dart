import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/privacy_page.dart';
import 'package:flutterdemo/utils/routes.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ClixDrawer extends StatefulWidget {
  const ClixDrawer({Key? key}) : super(key: key);

  @override
  _ClixDrawerState createState() => _ClixDrawerState();
}

class _ClixDrawerState extends State<ClixDrawer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://media-exp3.licdn.com/dms/image/C4E03AQGjrz-xFh1nGw/profile-displayphoto-shrink_200_200/0/1571492183759?e=1631145600&v=beta&t=MKfmV01okx8vHiWH-4aWF-alf6aLDL5wtYfmegqHOs4";
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0,right: 15.0),
                child: Align(
                  alignment: FractionalOffset.topRight,
                  child: IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30),
                child: DrawerHeader(
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/profile.jpeg"),
                        backgroundColor: Colors.white,
                        maxRadius: 50,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, MyRoutes.profileRoute),
                        child: Text("Venkatesh Pandian",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),

                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.fingerprint,
                  color: Colors.black,
                ),
                onTap: ()=>Navigator.pushNamed(context, MyRoutes.webViewRoute,arguments: "https://www.clix.capital/privacy-policy"),
                title: Text(
                  "Privacy Policy",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.format_list_bulleted,
                  color: Colors.black,
                ),
                onTap: ()=>Navigator.pushNamed(context, MyRoutes.webViewRoute,arguments: "https://www.clix.capital/terms"),
                title: Text(
                  "Terms & Conditions",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.live_help_outlined,
                  color: Colors.black,
                ),
                onTap: ()=>Navigator.pushNamed(context, MyRoutes.helpRoute),
                title: Text(
                  "Help",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onTap: ()=>Navigator.popUntil(context,ModalRoute.withName(MyRoutes.loginRoute)),
                title: Text(
                  "Logout",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "www.clix.capital",
                          textScaleFactor: 0.8,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Brandico.linkedin_1,
                            color: Color.fromARGB(1000, 0, 119, 181),
                          ),
                          Icon(
                              Brandico.facebook_1,
                              color: Color.fromARGB(1000, 72, 103, 170),
                          ),
                          Icon(
                              Brandico.twitter_1,
                              color: Color.fromARGB(1000, 93, 169, 221),
                          ),
                          Icon(
                              Brandico.instagram_1,
                            color: Color.fromARGB(1000, 198, 33, 139),
                          ),
                          Icon(
                              FontAwesome.whatsapp,
                            color: Color.fromARGB(1000, 42, 196, 66),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          child: Container(
                            height: 5,
                            color: Color.fromARGB(1000, 3, 155, 227),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 5,
                            color: Color.fromARGB(1000, 73, 112, 183),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 5,
                            color: Color.fromARGB(1000, 160, 36, 139),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            height: 5,
                            color: Color.fromARGB(1000, 241, 6, 122),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
