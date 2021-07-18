import 'package:flutter/material.dart';
import 'package:flutterdemo/models/loan_model.dart';
import 'package:flutterdemo/utils/utils.dart';
import 'package:flutterdemo/widgets/active_loan_item.dart';


class ActiveTabPage extends StatefulWidget {
  const ActiveTabPage({Key? key}) : super(key: key);

  @override
  _ActiveTabPageState createState() => _ActiveTabPageState();
}

class _ActiveTabPageState extends State<ActiveTabPage> {
  final utils = Utils();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    List<ActiveLoanModel> _loansList = [ActiveLoanModel(name: "Personal Loan", icon: "assets/images/save.png", status: "Active", amount: "25,00,000", emi: "54,550", tenure: "60 Months", dueDate: "7th May"),
      ActiveLoanModel(name: "Home Loan", icon: "assets/images/home.png", status: "Active", amount: "5,00,000", emi: "94,334", tenure: "120 Months", dueDate: "9th May"),
      ActiveLoanModel(name: "Business Loan", icon: "assets/images/offer.png", status: "Active", amount: "10,00,000", emi: "24,334", tenure: "60 Months", dueDate: "11th May"),];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: ListView.builder(itemCount: _loansList.length,scrollDirection: Axis.vertical,
            shrinkWrap:true,itemBuilder: (context, index){
              return ActiveLoanItem(name: _loansList[index].name,
                icon: _loansList[index].icon, status: _loansList[index].status,
                amount: _loansList[index].amount, emi: _loansList[index].emi,
                tenure: _loansList[index].tenure, dueDate: _loansList[index].dueDate,
                index: index,);
            })

      ),
    );
  }
}



