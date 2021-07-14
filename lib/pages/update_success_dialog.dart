import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key}) : super(key: key);

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
      width: 400,
      height: 320,
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
          SizedBox(
            height: 15,
          ),
          Center(
            child: Icon(
              Elusive.ok_circled2,
              color: Colors.green,
              size: 70,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Your request has been submitted successfully.",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Your request will be reviewed by internal team to make the changes.This will get updated in next 5 days. Incase of any issues please write to"
                      "Customer Care at ",
                  style: TextStyle(
                    color: Colors.grey,
                      fontWeight: FontWeight.normal
                  ),
                  children: [
                    TextSpan(
                      text: "hello@clix.capital",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)
                    )
                  ]
                ),
              ),
            ),
          )


        ],
      ),
    );
  }
}
