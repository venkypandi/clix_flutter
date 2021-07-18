import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 2,
        title: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 0,
                color: Color.fromRGBO(215, 215 , 215, 100),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Dear Customer, your payment will be credited instantly. In case of any issues with bank settlement"
                        " or network failure, we request you to wait for 24 to 48 hours to get the credit.",
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 2,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: RichText(
                            text:TextSpan(
                              text: "Loan Account Number\n",
                              style: TextStyle(
                                color: Colors.black26
                              ),
                              children: [
                                TextSpan(
                                  text: "YDS3000234TY4450",
                                  style: TextStyle(
                                    color: Colors.black,
                                  )
                                )
                              ]
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
                          child: RichText(
                              text:TextSpan(
                                  text: "Mobile Number\n",
                                  style: TextStyle(
                                      color: Colors.black26
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "8248663588",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 15),
                          child: RichText(
                              text:TextSpan(
                                  text: "Email ID\n",
                                  style: TextStyle(
                                      color: Colors.black26
                                  ),
                                  children: [
                                    TextSpan(
                                        text: "svenkateshpandian@gmail.com",
                                        style: TextStyle(
                                          color: Colors.black,
                                        )
                                    )
                                  ]
                              )
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            "Amount To Pay",
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        // PaymentButton()


                      ],
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

enum PaymentType { deuamount, customamount }

class PaymentButton extends StatefulWidget {
  const PaymentButton({Key? key}) : super(key: key);

  @override
  _PaymentButtonState createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  PaymentType _type = PaymentType.deuamount;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: const Text('EMI Due'),
            leading: Radio(
              value: PaymentType.deuamount,
              groupValue: _type,
              onChanged: (value){
                setState(() {
                  _type = value as PaymentType;
                });
              },
            ),
          ),
          Text(
            "₹ 54,550.00",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}

