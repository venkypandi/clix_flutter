import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/routes.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';


class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, MyRoutes.loanRoute));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Please wait while we redirect you to Clix App...",
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 14,
                  fontWeight: FontWeight.normal
                ),
              ),
              Icon(
                LineariconsFree.checkmark_cicle,
                size: 200,
                color: Colors.greenAccent,
              ),
              Text(
                "Thank You for making the payment of ₹ 54,550 against your Loan Account No.YDS3000234TY4450.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
