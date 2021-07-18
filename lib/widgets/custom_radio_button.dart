import 'package:flutter/material.dart';

class MyRadioListTile<T> extends StatelessWidget {
  final int value;
  final int? groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<int?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: EdgeInsets.only(left: 0, right: 25, top: 0, bottom: 5),
        child: Row(
          children: [
            _customRadioButton,
            SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.only(left: 0, top: 8, bottom: 8, right: 0),
      child: isSelected? CircleAvatar(
          radius: 8.0,
          backgroundColor: Colors.green,
          child: Icon(Icons.check_rounded, size: 11,
              color: Colors.white)
        // Image(fit: BoxFit.fill,image: AssetImage('assets/green_tick.png'), width: 20,height: 20)
      ): Icon(Icons.radio_button_unchecked_outlined, size: 20, color: Colors.grey,)
    );
  }
}