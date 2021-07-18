import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/utils.dart';


class CustomMonthPicker extends StatefulWidget{
  final List<String> months = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"];
  final ValueChanged<String> onMonthChanged;

  CustomMonthPicker({required this.onMonthChanged});

  @override
  _CustomMonthPickerState createState() => _CustomMonthPickerState();

}

class _CustomMonthPickerState extends State<CustomMonthPicker> {
  String selectedMonth = "JULY";
  final Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(width: 155, height: 30, color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            getMonthChangeIcon("-", getPreviousMonth, widget.months),
            utils.getText(text: selectedMonth, textColor: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
            getMonthChangeIcon("+", getNextMonth, widget.months)
          ],
        ),
      ),
    );
  }

  Widget getMonthChangeIcon(String icon, Function onTapFunction, List months) {
    return GestureDetector(
      onTap: () => {onTapFunction(months)},
      child: Container(alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(5)),
        width: 30,
        height: 30,
        child: Text(icon, style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.w400, color: Colors.white),),),
    );
  }

  void getNextMonth(List months) {
    var index = months.indexOf(selectedMonth);
    setState(() {
      selectedMonth = index + 1 > 11 ? selectedMonth : months[index + 1];
      print(selectedMonth);
      widget.onMonthChanged(selectedMonth);
    });
  }

  void getPreviousMonth(List months) {
    var index = months.indexOf(selectedMonth);

    setState(() {
      selectedMonth = index - 1 < 0 ? selectedMonth : months[index - 1];
      print(selectedMonth);
      widget.onMonthChanged(selectedMonth);
    });

  }

}



// Widget getMonthPicker(List months){
//
//   return
//     Align(
//       alignment: Alignment.center,
//       child: Container(
//         width: 155,
//         height: 30,
//         color: Colors.grey[100],
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             getMonthChangeIcon("-", getPreviousMonth, months),
//             utils.getText(text: selectedMonth, textColor: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
//             getMonthChangeIcon("+", getNextMonth, months)
//           ],
//         ),
//       ),
//     );
// }