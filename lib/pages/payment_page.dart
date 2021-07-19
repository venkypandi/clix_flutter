import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/utils.dart';
import 'package:flutterdemo/widgets/custom_radio_button.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final Utils utils = Utils();
  late int value;
  late int paymentValue;
  bool checked= false;

  @override
  void initState() {
    super.initState();
    value= 1;
    paymentValue= 3;
  }

  void setSelectedRadio(val){
    setState(() {
      value = val;
    });
  }

  void setPaymentOptionRadio(val){
    setState(() {
      paymentValue = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    TextEditingController amountController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 2,
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "EMI PAYMENT",
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Icon(
                FontAwesome.credit_card,
              ),
              Text(
                "Bill Pay",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        controller: ScrollController(),
        child: Container(
          height: height*1.2,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(margin: EdgeInsets.only(top: 10, bottom: 30),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[200],),
                child: Text('Dear Customer, your payment will be credited instantly. In case of any issues with bank settlement or network failure, we request you to wait for 24 to 48 hours to get the credit.',
                  style: TextStyle(fontSize:14, color: Colors.grey[600], fontWeight: FontWeight.normal),
                ),
              ),
              Card(
                elevation: 8,
                child: Container(
                  width: width,
                  padding: EdgeInsets.fromLTRB(28, 20, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      getContactDetails(utils,width),
                      utils.getSeparationWithSpaces(),
                      getAmountToPayDetails(utils, width, amountController, value),
                      utils.getSeparationWithSpaces(),
                      getPaymentOptionDetails(utils, width, paymentValue),
                      SizedBox(height: 20,),
                      getPayButton(context,width, height)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getContactDetails(Utils utils,double width) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        utils.getLoanDetailsColumn('Loan Account Number', 'YDS3000234TY4450', width),
        SizedBox(height: 20,),
        utils.getLoanDetailsColumn('Mobile Number', '9900000000', width),
        SizedBox(height: 20,),
        utils.getLoanDetailsColumn('Email ID', 'abhishek.arora@gmail.com', width),
      ],
    );
  }

  Widget getAmountToPayDetails(Utils utils,double width, TextEditingController amtController, int value){
    amtController..text = '54,550.00';
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        utils.getText(text:'Amount to Pay',textColor: Colors.pink,
            fontSize: 14, fontWeight: FontWeight.bold),
        SizedBox(height: 20,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    width: width*0.5,
                    child: MyRadioListTile(groupValue: value, value: 1, leading: '',
                      onChanged: (value) { setSelectedRadio(value); }, title: Text('EMI Due'),)
                ),
                Text('\u{20B9} 54,550.00\t\t\t\t', style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    child: MyRadioListTile(groupValue: value, value: 2, leading: '',
                      onChanged: (value) { setSelectedRadio(value); }, title: Text('Amount to Pay'),)
                ),
                Container(

                    height: MediaQuery.of(context).size.height*0.045,
                    padding: EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[200],),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('\u{20B9}'),
                        ),
                        getTextField(width, amtController)
                        // TextField(controller: amtController,)
                      ],
                    )
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget getTextField(double width, TextEditingController amtController){
    return Container(
      width: width*0.194,
      color: Colors.white,
      child: TextField(controller: amtController, decoration: InputDecoration(
          border: InputBorder.none, enabled: value==2? true:false),
          style: TextStyle(fontSize: 14, color: Colors.black), enableInteractiveSelection: false,
          keyboardType: TextInputType.number, maxLines: 1, showCursor: false, mouseCursor: null,
          cursorColor: Colors.white
      ),
    );
  }

  Widget getPaymentOptionDetails(Utils utils, double width, int? value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        utils.getText(text:'Payment Option',textColor: Colors.pink,
            fontSize: 14, fontWeight: FontWeight.bold),
        SizedBox(height: 15,),
        Container(
          width: width,
          // color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyRadioListTile(leading: '', onChanged: (val) {
                setPaymentOptionRadio(val);
              },
                title: Image(image: AssetImage('assets/images/razorpay.png'),width: 100, fit: BoxFit.fill,),
                groupValue: paymentValue, value: 3,),
              SizedBox(width: 1,),
              MyRadioListTile(leading: '', onChanged: (val) {
                setPaymentOptionRadio(val);
              },
                title: Image(image: AssetImage('assets/images/billdesk.png'),width: 80, fit: BoxFit.contain, ),
                groupValue: paymentValue, value: 4,)
            ],
          ),
        ),
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyRadioListTile(leading: '', onChanged: (val) {
                setPaymentOptionRadio(val);
              },
                title: Image(image: AssetImage('assets/images/setu.png'),width: 100,height: 120, ),
                groupValue: paymentValue, value: 5,),
            ]
        )
      ],
    );
  }

  Widget getPayButton(BuildContext context, double width, double height){
    return ElevatedButton(onPressed: () {
      if(paymentValue == 3){
        // Navigator.pushNamed(context, RAZORPAY);
      }
    },
      child: ListTile(
        title: Container(margin: EdgeInsets.only(top: 0, bottom: 10),
          child: Text('PAY NOW', textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),),
        ),
        leading: Container(width: width*0.05,),
        trailing: Container(margin: EdgeInsets.only(top: 0, bottom: 10),
            child: Icon(Icons.arrow_forward, color: Colors.white,)),),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
              Size(width *0.9, height * 0.06)),
          textStyle: MaterialStateProperty.all(
              TextStyle(color: Colors.white)),
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)))
      ),);
  }
}

