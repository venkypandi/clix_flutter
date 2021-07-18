import 'package:flutter/material.dart';
import 'package:flutterdemo/models/loan_model.dart';
import 'package:flutterdemo/utils/utils.dart';

class IncompleteTabPage extends StatefulWidget {
  const IncompleteTabPage({Key? key}) : super(key: key);

  @override
  _IncompleteTabPageState createState() => _IncompleteTabPageState();
}

class _IncompleteTabPageState extends State<IncompleteTabPage> {
  IncompleteLoanModel incompleteLoanDetails = IncompleteLoanModel(applicationDate: "7th May,2021", applicationId: "YDS209917TY72");


  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(color: Colors.white,
      child:Stack(
          alignment: AlignmentDirectional.topCenter,
          children:[
            SizedBox(height: 30,),
            Container(
              width: width*0.9,
              height: height* 0.4,
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      color: Colors.white,
                      elevation: 7,
                      child: Stack(
                        children: [
                          utils.getStatusTag('INCOMPLETE', false),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                  utils.getCardTitle("Personal Loan", "assets/images/save.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40, right: 30),
                                    child: utils.getLoanDetails('Application Start Date', incompleteLoanDetails.applicationDate, 'Application ID',
                                        incompleteLoanDetails.applicationId, width),
                                  ),
                                  SizedBox(height: 20,)
                               ],
                              ),
                            ],
                          ),
                    ),
                  utils.getFootNote('* Click to complete'),
                ],
              ),
            ),
          ]
    ),);
  }
}









