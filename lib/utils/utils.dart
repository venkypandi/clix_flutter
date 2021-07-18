import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Utils{

  Image getAppBarTitle(
      {required String assetUrl,
        required BoxFit boxFit,
        required double height}) {
    return Image.asset(
      assetUrl,
      fit: boxFit,
      height: height,
    );
  }


  AppBar getAppBar({required String text}) {
    return AppBar(
      title: Text(
        text,
        style: TextStyle(color: Colors.pinkAccent),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 5,
      iconTheme: IconThemeData(
        color: Colors.grey[850],
      ),
    );
  }

  ElevatedButton getElevatedButton(
      {required String text,
        required Color bgColor,
        required double verticalPadding,
        required double horizontalPadding,
        required double elevation,
        required Function onPressed}) {
    return ElevatedButton(
        child: Text(text),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.disabled)
                ? Colors.grey
                : bgColor;
          }),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding)),
          elevation: MaterialStateProperty.all(elevation),
        ),
        onPressed: () => onPressed());
  }

  Widget getStatusTag(String status, bool isOpen){
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: EdgeInsets.only(top: 4, left: 10),
        height: 25,
        width: status=="ACTIVE"? 120: 130,
        decoration: BoxDecoration(
            color: status=="ACTIVE"? isOpen? Colors.red:Colors.grey[100]:
            status=="CLOSED"?isOpen? Colors.greenAccent[700]:Colors.grey[100]:Colors.grey[100],
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90.0),
                topRight: Radius.circular(10.0))),
        child: Text(status, textAlign: TextAlign.center,
          style: TextStyle(color: status=="ACTIVE"? isOpen? Colors.white:Colors.red:
          status=="CLOSED"? isOpen? Colors.white: Colors.greenAccent[700]:Colors.lightBlue[900],
              fontSize:13, fontWeight: FontWeight.bold),),
      ),
    );
  }

  Widget getCardTitle(String title, String icon){
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 30),
      title: getText(text: title, textColor: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      minLeadingWidth: 30,
      leading: Container(
        // margin: const EdgeInsets.only(bottom: 40.0),
        child: ImageIcon(AssetImage(icon), color: Colors.pink, size: 30),
      ),
    );
  }

  Widget getLoanDetailsColumn(String? title, String? detail, double width){

    return Container(
      width: title=='Email ID'?width*0.37:width * 0.25,
      // color: Colors.lightBlue,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        title==null?SizedBox(height: 5,): getText(text: title, textColor: Colors.grey.shade800,
            fontSize: 10, fontWeight: FontWeight.normal),
        detail==null?SizedBox(height: 5,): getText(text: detail, textColor: Colors.black,
            fontSize: 12, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget getLoanDetails(String titleOne, String detailOne, String titleTwo, String detailTwo, double width){
    return IntrinsicHeight(
      // margin: const EdgeInsets.only(left:30, bottom: 30.0, top: 90, right: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 5),
            child: getLoanDetailsColumn(titleOne, detailOne, width),
          ),
          SizedBox(width: titleTwo == "Tenure"?40: 20,),
          VerticalDivider(color: Colors.grey[400], width: 1, thickness: 1,endIndent: 0,),
          SizedBox(width: titleTwo == "Tenure"?40: 20,),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 5),
            child: getLoanDetailsColumn(titleTwo, detailTwo, width),
          )
        ],
      ),
    );
  }

  Widget getFootNote(String note){
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, bottom: 50, top: 10),
        child: Text(note, style: TextStyle(fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, color: Colors.black),),
      ),
    );
  }

  Text getText({required String text, required Color textColor, required double fontSize,
    required FontWeight fontWeight}) {
    return Text(text,
      style: TextStyle(color: textColor, fontSize: fontSize, fontWeight: fontWeight,),);
  }

  Widget getActiveLoanDetails(Utils utils, List titles, List values,  double width){

    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              utils.getLoanDetailsColumn(titles[0], values[0], width),
              SizedBox(height: 30,),
              utils.getLoanDetailsColumn(titles[1], values[1], width),
              titles.length == 5?SizedBox(height: 30,):SizedBox(height: 0,),
              titles.length == 5 ?utils.getLoanDetailsColumn(titles[2], values[2], width):utils.getLoanDetailsColumn(null, null, width)
            ],
          ),
          // titles[0]== 'Total Amount Due'?SizedBox(width: 30,): SizedBox(width: 0,),
          VerticalDivider(thickness: 1,width: 10, color: Colors.grey[400],),
          // SizedBox(width: 30,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              utils.getLoanDetailsColumn(titles.length == 5?titles[3]: titles[2], titles.length == 5?values[3]:values[2], width),
              SizedBox(height: 30,),
              utils.getLoanDetailsColumn(titles.length == 5?titles[4]:titles[3], titles.length == 5?values[4]: values[3], width),
            ],
          )
        ],
      ),
    );
  }

  Widget getDividerWithShadow(){
    return Container(
      height: 1,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(
              blurRadius: 1,
              spreadRadius: 2,
              color: Colors.grey.shade100,
              offset: Offset(1,1)
          )]
      ),
    );
  }

  Widget getSeparationWithSpaces(){

    return Column(
      children: [
        SizedBox(height: 20,),
        getDividerWithShadow(),
        SizedBox(height: 20,),
      ],
    );
  }

  Row getDownloadsRow(List icons, List titles, double width){
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getIconColumn(icons[0], titles[0], width),
        SizedBox(width: 20,),
        getIconColumn(icons[1], titles[1], width),
        SizedBox(width: 20,),
        getIconColumn(icons[2], titles[2], width),
      ],
    );
  }
  Icon getIcon(
      {required IconData iconData,
        required Color iconColor,
        required double iconSize}) {
    return Icon(
      iconData,
      size: iconSize,
      color: iconColor,
    );
  }
  Widget getIconColumn(String icon, String label, double width){
    return Container(
      width: width*0.2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: (){},
            icon: ImageIcon(AssetImage(icon), size: 25, color: label=='Bill Pay'?Colors.black: Colors.black87),),
          Text(label,  textAlign:TextAlign.center,
            style: TextStyle(fontSize: 11,
                color: label=='Bill Pay'?Colors.black:Colors.grey),)
        ],
      ),
    );
  }

  Text getAlignText(
      {required String text,
        required Color textColor,
        required double fontSize,
        required FontWeight fontWeight,
        required TextAlign alignment}) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,

      ),
    );
  }

  Text getMultiLineText(
      {required String text,
        required Color textColor,
        required double fontSize,
        required FontWeight fontWeight,
        required int maxLines}) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  IconButton getIconButton(
      {required Function onPress,
        required IconData iconData,
        required Color iconColor,
        required double iconSize}) {
    return IconButton(
        onPressed: () => onPress(),
        icon: getIcon(
            iconData: iconData, iconColor: Colors.black, iconSize: iconSize));
  }

  InkWell getImageButton(
      {required Function onPress,
        required String assetUrl,
        required BoxFit boxFit}) {
    return InkWell(
        onTap: () => onPress(),
        child: Container(
          margin: EdgeInsets.all(8),
          height: 25,
          width: 25,
          child: getImage(assetUrl: assetUrl, boxFit: boxFit),
        ));
  }

  Image getImage({required String assetUrl, required BoxFit boxFit}) {
    return Image.asset(
      assetUrl,
      fit: boxFit,
    );
  }

  Widget getCircularImageButton(
      {required String assetUrl,
        required BoxFit boxFit,
        required Color bgColor,
        required double radius,
        required Function onPressed}) {
    return InkWell(
        onTap: () => onPressed(),
        customBorder: CircleBorder(),
        child: getCircularImage(assetUrl: assetUrl, boxFit: boxFit, bgColor: bgColor, radius: radius));
  }

  Widget getCircularImage(
      {required String assetUrl,
        required BoxFit boxFit,
        required Color bgColor,
        required double radius,}) {
    return CircleAvatar(
      backgroundColor: bgColor,
      radius: radius,
      child: Container(
        margin: EdgeInsets.all(8),
        child: getImage(
          assetUrl: assetUrl,
          boxFit: boxFit,),
      ),
    );
  }

  Widget getCircleAvatar({
    required String assetUrl,
    required Color bgColor,
    required double radius,
  }) {
    return CircleAvatar(
      backgroundColor: bgColor,
      radius: radius,
      backgroundImage: AssetImage(assetUrl),
    );
  }

  TextFormField getTextFormField(
      {required String label,
        required String hint,
        required String errorMsg,
        required TextEditingController editController,
        required TextInputType inputType,
        required double textSize,
        required double labelSize,
        required int maxlength,
        required Function onTap}) {
    return TextFormField(
      onTap: () => onTap(),
      controller: editController,
      keyboardType: inputType,
      maxLength: maxlength,
      style: TextStyle(
        color: Colors.black,
        fontSize: textSize,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return errorMsg;
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        labelStyle:
        TextStyle(height: 1, fontSize: labelSize, color: Colors.black),
      ),
    );
  }

  ListTile getDrawerTile(
      {required String title,
        required IconData icon,
        required Function() onTap}) {
    return ListTile(
      onTap: () => onTap(),
      title: getText(
          text: title,
          textColor: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.normal),
      leading: getIcon(iconData: icon, iconColor: Colors.black, iconSize: 24),
    );
  }

  RichText getRichText({
    required Color textColor,
    required double textFontSize,
    required String text1,
    required String text2,
    required int maxLines}) {
    return RichText(
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        // textDirection: TextDirection.ltr,
        textAlign: TextAlign.justify,
        text: TextSpan(
            style: TextStyle(color: textColor, fontSize: textFontSize),
            children: [
              TextSpan(text: text1),
              TextSpan(
                  text: text2,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
            ]));
  }

  RichText getCreditText({
    required Color textColor,
    required double textFontSize,
    required String text1,
    required String text2,
    required int maxLines,
    required TextAlign textAlign}) {
    return RichText(
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        // textDirection: TextDirection.ltr,
        textAlign: textAlign,
        text: TextSpan(
            style: TextStyle(color: textColor, fontSize: textFontSize),
            children: [
              TextSpan(text: text1),
              TextSpan(
                  text: text2,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
            ]));
  }

  RichText getRichTextHead({
    required Color textColor,
    required double textFontSize,
    required String text1,
    required String text2,
    required int maxLines}) {
    return RichText(
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        // textDirection: TextDirection.ltr,
        textAlign: TextAlign.justify,
        text: TextSpan(
            style: TextStyle(color: textColor, fontSize: textFontSize),
            children: [
              TextSpan(
                  text: text1,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: text2),
            ]));
  }

  showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey.shade800,
        textColor: Colors.white,
        fontSize: 16.0

    );
  }

  Widget getLoader() {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 60,
        height: 60,
        padding: EdgeInsets.all(10),
        child: CircularProgressIndicator(
            color: Colors.pink
        ),
      ),
    );
  }

  String getDateFormat({required String date}) {
    var formatter = DateFormat('dd-MM-yyyy').parse(date);
    var uiFormatter = DateFormat('dd MMM yyyy').format(formatter);
    return uiFormatter;
  }

  String getNumberFormat({required int amount}) {
    var formatter = NumberFormat('#,##,000');
    return formatter.format(amount);
  }

}