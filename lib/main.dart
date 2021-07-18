import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/help_page.dart';
import 'package:flutterdemo/pages/home_page.dart';
import 'package:flutterdemo/pages/login_page.dart';
import 'package:flutterdemo/pages/my_loans_page.dart';
import 'package:flutterdemo/pages/notification_page.dart';
import 'package:flutterdemo/pages/payment_page.dart';
import 'package:flutterdemo/pages/privacy_page.dart';
import 'package:flutterdemo/pages/profile_page.dart';
import 'package:flutterdemo/utils/routes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner:false,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.webViewRoute: (context) => PrivacyPage(),
        MyRoutes.helpRoute: (context) => HelpPage(),
        MyRoutes.profileRoute: (context) => ProfilePage(),
        MyRoutes.paymentRoute: (context) => PaymentPage(),
        MyRoutes.loanRoute: (context) => MyLoansPage(),
        MyRoutes.notifications: (context) => NotificationPage()
      },
      initialRoute: MyRoutes.loanRoute,
    );
  }
}

