
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutterdemo/repository/notification_repository.dart';
import 'package:flutterdemo/utils/utils.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:group_list_view/group_list_view.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final Utils utils = Utils();
  bool loading = true;
  Map<String, List<String>> notifications= Map();
  var mapList = {};
  late SlidableController slidableController;

  getNotificationData() async {
    NotificationRepository notificationRepo = NotificationRepository();
    await notificationRepo.getNotificationModelData();
    mapList = notificationRepo.mapList;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    slidableController = SlidableController();
    super.initState();
    getNotificationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: utils.getAppBar(text: 'My Notifications'),
      body: loading? Center(child: utils.getLoader()) : getGroupListView(),
    );
  }

  GroupListView getGroupListView() {
    return GroupListView(
      padding: EdgeInsets.only(top: 10),
      sectionsCount: mapList.keys.toList().length,
      countOfItemInSection: (int section) {
        return mapList.values.toList()[section].length;
      },
      groupHeaderBuilder: (BuildContext context, int section) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 10, 5),
          child: utils.getText(
              text: mapList.keys.toList()[section],
              textColor: Colors.grey.shade600,
              fontSize: 14,
              fontWeight: FontWeight.normal),
        );
      },
      itemBuilder: (BuildContext context, IndexPath index) {
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.2,
          child: Container(
            decoration: BoxDecoration(
                border:
                Border(bottom: BorderSide(color: Colors.grey.shade500))),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(40, 0, 30, 0),
              title: utils.getText(
                  text: mapList.values.toList()[index.section][index.index]['message'],
                  textColor: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal),
            ),
          ),
          secondaryActions: [
            IconSlideAction(
              color: Colors.grey.shade200,
              iconWidget: utils.getIcon(
                  iconData: FontAwesome.trash_empty,
                  iconColor: Colors.pink,
                  iconSize: 30),
              onTap: () {
                setState(() {
                  loading = true;
                  mapList.values.toList()[index.section].removeAt(index.index);
                  loading  = false;
                });

              },
            )
          ],
        );
      },
    );
  }


}