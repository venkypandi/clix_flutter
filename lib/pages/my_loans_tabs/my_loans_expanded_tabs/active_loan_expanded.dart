import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/models/loan_model.dart';
import 'package:flutterdemo/utils/routes.dart';
import 'package:flutterdemo/utils/utils.dart';
import 'package:flutterdemo/widgets/custom_month_picker.dart';
import 'package:ndialog/ndialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../PDFScreen.dart';

class ActiveLoanExpanded extends StatefulWidget {

  ActiveLoanExpanded();

  @override
  _ActiveLoanExpandedState createState() => _ActiveLoanExpandedState();
}

class _ActiveLoanExpandedState extends State<ActiveLoanExpanded> {
  late bool isLoading;
  bool _allowWriteFile=false;
  List<ActiveLoanModel> loans = [ActiveLoanModel(name: "Personal Loan", icon: "assets/images/save.png", status: "Active", amount: "25,00,000", emi: "54,550", tenure: "60 Months", dueDate: "7th May"),
    ActiveLoanModel(name: "Home Loan", icon: "assets/images/home.png", status: "Active", amount: "5,00,000", emi: "94,334", tenure: "120 Months", dueDate: "9th May"),
    ActiveLoanModel(name: "Business Loan", icon: "assets/images/offer.png", status: "Active", amount: "10,00,000", emi: "24,334", tenure: "60 Months", dueDate: "11th May"),];
  String selectedMonth = "JULY";
  final utils = Utils();

  late String pdfUrl;

  late Dio dio;
  String progress="";
  @override
  void initState() {
    super.initState();
    dio = Dio();
    pdfUrl="https://www.cs.purdue.edu/homes/ayg/CS251/slides/chap2.pdf";
  }

  Future<String> getDirectoryPath() async
  {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    // Directory directory= await new Directory(appDocDirectory.path+'/'+'dir').create(recursive: true);

    return appDocDirectory.path;
  }

  requestWritePermission() async {

    if (await Permission.storage.request().isGranted) {
      setState(() {

        _allowWriteFile = true;

      });
    }else
    {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }


  }

  Future downloadFile(String url,path) async {
    if(!_allowWriteFile)
    {
      requestWritePermission();
    }
    try{
      ProgressDialog progressDialog=ProgressDialog(context,dialogTransitionType: DialogTransitionType.Bubble,title: Text("Downloading File"), message: null);

      progressDialog.show();
      await dio.download(url, path,onReceiveProgress: (rec,total){
        setState(() {
          isLoading=true;
          progress=((rec/total)*100).toStringAsFixed(0)+"%";
          debugPrint(path.toString()+" downloaded");
          progressDialog.setMessage(Text( "Dowloading $progress"));
        });

      });
      progressDialog.dismiss();

    }catch( e)
    {

      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<String> months = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"];

    return Container(
      color: Colors.white,
      child: Column(children: [
        utils.getDividerWithShadow(),
        getLoanDetailsPart(width),

        utils.getSeparationWithSpaces(),
        getRepaymentDetailsPart(width),

        utils.getSeparationWithSpaces(),
        getPaymentDetailsPart(width, months),

        utils.getSeparationWithSpaces(),
        getPayButton(width, height),

        utils.getSeparationWithSpaces(),
        getDownloadDocsPart(width),
      ]),
    );
  }


 Widget getPayButton(double width, double height){
    return Container(
      margin: EdgeInsets.only(left: 40, right: 30),
      child: ElevatedButton(onPressed: () {
        Navigator.pushNamed(context, MyRoutes.paymentRoute);
      },
        child: ListTile(
          title: Container(margin: EdgeInsets.only(top: 0, bottom: 5),
            child: Text('PAY \u{20B9} 54,550', textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),),
          ),
          leading: Container(margin: EdgeInsets.only(top: 0, bottom: 5),
              child: Icon(Icons.credit_card, color: Colors.white)),
          trailing: Container(margin: EdgeInsets.only(top: 0, bottom: 5),
              child: Icon(Icons.arrow_forward, color: Colors.white,)),),
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
                Size(width * 0.8, height * 0.065)),
            textStyle: MaterialStateProperty.all(
                TextStyle(color: Colors.white)),
            backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)))
        ),),
    );
  }

 Widget getLoanDetailsPart(double width){
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
          utils.getActiveLoanDetails(utils, ['Customer Unique ID', 'Loan Account Number',
            'Interest Rate', 'EMI Cycle'], ['1000002545190', 'ADS20198988810', '11%',
            '7th of every Month'], width
          ),
        ],
      ),
    );
 }

 Widget getRepaymentDetailsPart(double width){
    return Container(
        padding: EdgeInsets.only(left: 40, right: 30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            utils.getText(text:'Repayment Details',textColor: Colors.pink,
                fontSize: 14, fontWeight: FontWeight.bold),
            SizedBox(height: 30,),
            utils.getActiveLoanDetails(utils, [
              'Total Amount Due',
              'Total Tenure Due',
              'Next Payment Due Date',
              'Last Payment Made'
            ],
                [
                  '\u{20B9} 9,00,000',
                  '18 Months',
                  '7th May, 2021',
                  '5th April, 2021'
                ], width
            ),
          ],
        )
    );
 }

  void getUpdatedMonth(String month){
    // var currentMonth ;
    setState(() {
      selectedMonth = month;
    });
    // return selectedMonth;
  }
 Widget getPaymentDetailsPart(double width, List months,){
    return Container(
      padding: EdgeInsets.only(left: 40, right: 30),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          utils.getText(text:'Last 5 Payment Details',textColor: Colors.pink,
              fontSize: 14, fontWeight: FontWeight.bold),
          SizedBox(height: 30,),
          CustomMonthPicker(onMonthChanged: getUpdatedMonth),
          SizedBox(height: 40,),
          utils.getActiveLoanDetails(utils, ['Payment Detail', 'Amount', 'Bounce Reason',
            'Payment Mode', 'Status'], ['5th $selectedMonth, 2021', '\u{20B9} 52,334',
            '-NA-', 'UPI', 'Cleared'], width),
        ],
      ),
    );
 }

 Widget getDownloadDocsPart(double width){
    return Container(
      padding: EdgeInsets.only(left: 40, right: 30),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          utils.getText(text:'Download Documents',textColor: Colors.pink, fontSize: 14, fontWeight: FontWeight.bold),
          SizedBox(height: 20,),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: utils.getDownloadsRow(['assets/images/certificate.png', 'assets/images/invoice.png', 'assets/images/marketing.png'], ['Interest Certificate', 'Account Statement',
                    'EMI\nSchedule'], width),
                  onTap: (){
                    getDirectoryPath().then((value){
                      File f=File("/storage/emulated/0/Download/clix.pdf");
                      downloadFile(pdfUrl, f.path);
                    });

                  },
                ),
                SizedBox(height: 20,),
                utils.getDownloadsRow(['assets/images/script.png', 'assets/images/open_mail.png', 'assets/images/success.png'], ['Loan  Agreement', 'Welcome\nKit',
                  'Foreclosure Statement'], width),
              ],
            ),
          ),
          SizedBox(height: 30,),
        ],
      ),
    );
 }

}


