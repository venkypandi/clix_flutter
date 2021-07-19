import 'package:flutter/material.dart';
import 'package:flutterdemo/models/loan_model.dart';
import 'package:flutterdemo/utils/utils.dart';

import 'my_loans_expanded_tabs/closed_loan_expanded.dart';

class ClosedTabPage extends StatefulWidget {
  const ClosedTabPage({Key? key}) : super(key: key);

  @override
  _ClosedTabPageState createState() => _ClosedTabPageState();
}

class _ClosedTabPageState extends State<ClosedTabPage> {
  bool isOpen = false;
  bool loading = true;
  ClosedLoanModel closedLoan=ClosedLoanModel(loanAmount: "25,00,000", tenure: "60 Months");


  @override
  Widget build(BuildContext context) {
    final utils = Utils();
    var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Container(color: Colors.white,
            padding: EdgeInsets.only(top: 50),
            child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      // height: height* 0.4,
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: isOpen ? Colors.grey[200] : Colors.white,
                            elevation: 8,
                            child: Stack(
                              children: [
                                utils.getStatusTag('CLOSED', isOpen),
                                getClosedExpansionTile(width)
                              ],
                            ),
                          ),
                          utils.getFootNote('* Click to Expand'),
                        ],
                      ),
                    ),
                  ),
                ]
            ),),
        ),
      ),
    );
  }


Widget getClosedMainTile(double width) {
    var utils = Utils();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        utils.getCardTitle("Personal Loan", "assets/images/save.png"),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: utils.getLoanDetails(
              'Loan Amount', '\u{20B9} ${closedLoan.loanAmount}', 'Tenure', closedLoan.tenure,
              width),
        ),
        SizedBox(height: 30,)
      ],
    );
  }


Widget getClosedExpansionTile(double width) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ExpansionTile(title: getClosedMainTile(width),
        initiallyExpanded: false,
        textColor: Colors.black,
        onExpansionChanged: (bool isChanged) {
          setState(() {
            print("isChanged: $isChanged");
            isOpen = isChanged;
            print("isOpen: $isOpen");
          });
        },
        tilePadding: EdgeInsets.zero,
        trailing: SizedBox.shrink(),
        children: [ClosedLoanExpanded()],
      ),
    );
  }


}
