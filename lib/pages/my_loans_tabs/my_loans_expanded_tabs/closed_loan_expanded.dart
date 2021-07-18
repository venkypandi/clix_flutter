
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/utils.dart';

class ClosedLoanExpanded extends StatefulWidget {
  const ClosedLoanExpanded({Key? key}) : super(key: key);

  @override
  _ClosedLoanExpandedState createState() => _ClosedLoanExpandedState();
}

class _ClosedLoanExpandedState extends State<ClosedLoanExpanded> {
  final utils = Utils();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          utils.getDividerWithShadow(),
          getClosedLoanDetailsPart(width),

          utils.getSeparationWithSpaces(),
          getClosedRepaymentDetailsPart(width),

          utils.getSeparationWithSpaces(),
          getClosedDownloadDocsPart(width)
        ],
      ),
    );
  }

  getClosedLoanDetailsPart(double width){
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.only(left: 40, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          utils.getText(text:'Loan Details',textColor: Colors.pink,
              fontSize: 14, fontWeight: FontWeight.bold),
          SizedBox(height: 30,),
          utils.getActiveLoanDetails(utils, ['Customer Unique ID', 'Loan Account Number', 'Loan Closure Date', 'Interest Rate'],
              ['1000002545190', 'ADS20198988810', '27th May, 2021', '12%'], width
          ),
        ],
      ),
    );
  }

  Container getClosedRepaymentDetailsPart(double width){
    return Container(
        padding: EdgeInsets.only(left: 40, right: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            utils.getText(text:'Repayment Details',textColor: Colors.pink, fontSize: 14, fontWeight: FontWeight.bold),
            SizedBox(height: 30,),
            utils.getLoanDetails('Total Amount Due', '\u{20B9} 0', 'Last Payment Made','27th Feb, 2021',width
            ),
          ],
        )
    );
  }

  Container getClosedDownloadDocsPart(double width){
    return Container(
      padding: EdgeInsets.only(left: 40, right: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          utils.getText(text:'Download Documents',textColor: Colors.pink,
              fontSize: 14, fontWeight: FontWeight.bold),
          SizedBox(height: 20,),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                utils.getDownloadsRow(['assets/images/script.png', 'assets/images/invoice.png', 'assets/images/approve.png'], ['Loan Agreement', 'Account Statement',
                  'Download NOC'], width),
                SizedBox(height: 20,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // SizedBox(width: 20,),
                    utils.getIconColumn('assets/images/marketing.png', 'EMI Schedule', width),
                    // SizedBox(width: 20,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
  }
}

