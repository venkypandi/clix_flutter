import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterdemo/pages/otp_dialog_box.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkValue = false;
  String mobileNumber = "";
  bool numberFlag = false;
  bool panFlag = false;
  bool lanFlag = false;
  final _formKey = GlobalKey<FormState>();

  validateButton(BuildContext context){

    if(_formKey.currentState!.validate()){
      if(!numberFlag) {
        setState(() {
          numberFlag = true;
        });
      }else{
        setState(() {
          panFlag = true;
        });
      }
      if(panFlag){
        setState(() {
          lanFlag = true;
        });
      }
      if(checkValue){
        setState(() {
          _showToast(context);
        });

      }

    }


  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Login Successful')
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child:SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/clix.png"),
            Center(
              child: Card(
                margin: EdgeInsets.all(20),
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (value){
                            if(value!.isEmpty){
                              return "Mobile number cannot be empty";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your mobile number",
                            labelText: "Mobile Number",
                            labelStyle: TextStyle(
                              color: Colors.black
                            )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (numberFlag) TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "PAN number cannot be empty";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter your PAN number",
                              labelText: "PAN Number",
                              labelStyle: TextStyle(

                                  color: Colors.black
                              )
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        if (numberFlag && panFlag) TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "LAN number cannot be empty";
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Enter your LAN number",
                              labelText: "LAN Number",
                              labelStyle: TextStyle(

                                  color: Colors.black
                              )
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              activeColor: Colors.cyan,
                              checkColor: Colors.white,
                              value: this.checkValue,
                              onChanged: (value){
                                setState(() {
                                  checkValue = value!;
                                });
                              },
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10),
                                child: Text("I authorize Clix Capital to connect with me through Call/ SMS/ Whatsapp/ Email towards this application and other products/services. This consent overrides my registration for DNC/NDNC. Terms of Use & Privacy Policy.",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(

                          child: Text("SUBMIT"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pinkAccent,
                          ),
                          onPressed:(){
                            validateButton(context);
                            if(checkValue && numberFlag && panFlag && lanFlag){
                              showDialog(context: context,
                                  builder: (BuildContext context){
                                    return OtpDialogbox(number: "8248663588");
                                  });
                            }

                          }
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}
