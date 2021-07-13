import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/routes.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OtpDialogbox extends StatefulWidget {
  final String number;
  const OtpDialogbox({Key? key,required this.number}) : super(key: key);

  @override
  _OtpDialogboxState createState() => _OtpDialogboxState();
}

class _OtpDialogboxState extends State<OtpDialogbox> {
  String otp = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Container(
      height: 300,
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                )
            ),
          ),
          Center(
            child: Text(
              "Verify your Identity",
              style: TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "OTP has been sent on ${widget.number}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.center,
              fieldWidth: 20,
              otpFieldStyle: OtpFieldStyle(
                enabledBorderColor: Colors.black,
                focusBorderColor: Colors.black
              ),
              style: TextStyle(
                fontSize:18,
                color: Colors.black,
              ),
              onCompleted: (pin){
                otp=pin;
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Center(
            child: ElevatedButton(
              child: Text("SUBMIT"),
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
              ),
              onPressed:(){
                Navigator.pushNamed(context, MyRoutes.homeRoute);
                Fluttertoast.showToast(
                  msg: "You have Logged In Successfully.",
                  toastLength: Toast.LENGTH_LONG,
                  fontSize: 18.0,
                );
              }
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Resend OTP",
              style: TextStyle(
                fontSize: 12,
                color: Colors.blueAccent
              ),
            ),
          )

        ],
      ),
    );
  }
}
