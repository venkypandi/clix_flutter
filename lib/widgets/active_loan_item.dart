import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterdemo/pages/my_loans_tabs/my_loans_expanded_tabs/active_loan_expanded.dart';
import 'package:flutterdemo/utils/utils.dart';

class ActiveLoanItem extends StatefulWidget
{
  final String name;
  final String icon;
  final String status;
  final String amount;
  final String emi;
  final String tenure;
  final String dueDate;
  final int index;

  const ActiveLoanItem({Key? key,
    required this.name, required this.icon, required this.status, required this.amount,
    required this.emi, required this.tenure, required this.dueDate, required this.index
  }) : super(key: key);

  @override
  _ActiveLoanItemState createState() => _ActiveLoanItemState();
}

class _ActiveLoanItemState extends State<ActiveLoanItem> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    var utils = Utils();
    var width = MediaQuery
        .of(context)
        .size
        .width;
    // var height = MediaQuery
    //     .of(context)
    //     .size
    //     .height;

    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          elevation: 7,
          color: isOpen ? Colors.grey[200] : Colors.white,
          child: Container(
            width: width * 0.9,
            child: Stack(
              children: [
                utils.getStatusTag(widget.status, isOpen),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ExpansionTile(
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
                    title: getActiveMainTile(
                        widget.status, [widget.name, widget.icon], [
                      widget.amount,
                      widget.emi,
                      widget.tenure,
                      widget.dueDate
                    ], width),
                    children: [
                      ActiveLoanExpanded()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        utils.getFootNote('* Click to Expand'),
      ],
    );
  }

}


Widget getActiveMainTile(String status, List cardTitleDetails, List values,  double width){
  final Utils utils = Utils();
  return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          utils.getCardTitle(cardTitleDetails[0], cardTitleDetails[1]),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 0),
            child: utils.getActiveLoanDetails(utils, ['Loan Amount', 'EMI', 'Tenure', 'EMI Due Date'],
                ["\u{20B9} "+ values[0], "\u{20B9} "+ values[1], values[2], values[3]], width
            ),
          ),
          SizedBox(height: 10,)
        ],
      );
}