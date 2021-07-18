import 'dart:convert';
import "package:collection/collection.dart";
import 'package:http/http.dart';

class NotificationRepository{
  var notificationList = [];
  var mapList = {};

  getNotificationModelData() async{
   var response = await NotificationApi().getNotificationData();
   var jsonData = jsonDecode(response.body);

   jsonData['notification'].forEach((element) {

       var notificationModel = {
         'date': element['date'],
         'message': element['message']
       };

       notificationList.add(notificationModel);
   });

   mapList = notificationList.groupListsBy((obj) => obj['date']);

    }
  }
class NotificationApi{

  Future getNotificationData() async {
    var notifications = await get(Uri.parse('https://run.mocky.io/v3/d37f41b4-b024-49b2-bfb9-a981f45a198e'));

    return notifications;
  }
}
