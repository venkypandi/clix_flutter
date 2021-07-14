import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/pages/update_success_dialog.dart';

class UpdateMobile extends StatefulWidget {
  const UpdateMobile({Key? key}) : super(key: key);

  @override
  _UpdateMobileState createState() => _UpdateMobileState();
}

class _UpdateMobileState extends State<UpdateMobile> {
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
      height: 400,
      width: 400,
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
              "Change Mobile Number",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Enter New Mobile Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                            ),
                            hintText: "Mobile Number",

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Enter OTP:",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          hintText: "OTP Here",

                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Resend OTP",
                        textScaleFactor: 0.8,
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent,
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                        showDialog(context: context,
                            builder:(context) => SuccessDialog());
                      },
                      child: Text(
                          "SUBMIT"
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),

        ],
      ),

    );
  }
}
