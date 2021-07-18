import 'package:flutter/material.dart';


class LoanTabBar extends StatelessWidget implements PreferredSizeWidget {
  final tabController;
  LoanTabBar.name(this.tabController);


  @override
  Widget build(BuildContext context) {

    return Container(
      child: TabBar(isScrollable: false,
      controller: tabController,
      labelPadding: EdgeInsets.only(bottom: 0),
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      unselectedLabelStyle: TextStyle(fontSize: 14),
      labelColor:Colors.pink, unselectedLabelColor: Colors.grey[800], indicatorColor: Colors.pink,
      tabs: [
        Tab(icon: ImageIcon(AssetImage('assets/images/quarter.png'),color:tabController.index == 0?Colors.pink: Colors.grey[800],),
          text: 'Incomplete', iconMargin: EdgeInsets.only(top:10, bottom: 10),),
        Tab(icon: ImageIcon(AssetImage('assets/images/solutions.png'),
            color: tabController.index == 1 ?Colors.pink: Colors.grey[800]), text: 'Active', iconMargin: EdgeInsets.only(top:10, bottom: 10)),
        Tab(icon: ImageIcon(AssetImage('assets/images/verified.png'), color: tabController.index == 2?Colors.pink: Colors.grey[800]),
            text: 'Closed', iconMargin: EdgeInsets.only(top:10, bottom: 10)),
      ]),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
