import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/utils/routes.dart';
import 'package:flutterdemo/widgets/loan_tab_bar.dart';

import 'my_loans_tabs/active_tab_page.dart';
import 'my_loans_tabs/closed_tab_page.dart';
import 'my_loans_tabs/incomplete_tab_page.dart';

class MyLoansPage extends StatefulWidget {
  const MyLoansPage({Key? key}) : super(key: key);

  @override
  _MyLoansPageState createState() => _MyLoansPageState();
}

class _MyLoansPageState extends State<MyLoansPage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length:3, vsync: this, initialIndex: 1);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {

    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.popAndPushNamed(context, MyRoutes.homeRoute);
        return Future.value(true);
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back, size: 30,), onPressed:(){
              Navigator.pushNamed(context,MyRoutes.homeRoute);
            }),
            iconTheme: IconThemeData( color: Colors. black,),
            backgroundColor: Colors.white,
            title: Text('MY LOANS', style: TextStyle(color: Colors.pink),),
            centerTitle: true,
            bottom: LoanTabBar.name(_tabController),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              IncompleteTabPage(),
              ActiveTabPage(),
              ClosedTabPage(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget getTabBar(TabController tabController){
    return TabBar(isScrollable: false,
        controller: tabController,
        labelPadding: EdgeInsets.only(bottom: 0),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        labelColor:Colors.pink, unselectedLabelColor: Colors.grey[800], indicatorColor: Colors.pink,
        tabs: [
          Tab(icon: ImageIcon(AssetImage('assets/images/quarter.png'),color:_tabController.index == 0?Colors.pink: Colors.grey[800],),
            text: 'Incomplete', iconMargin: EdgeInsets.only(top:10, bottom: 10),),
          Tab(icon: ImageIcon(AssetImage('assets/images/solutions.png'),
              color: _tabController.index == 1 ?Colors.pink: Colors.grey[800]), text: 'Active', iconMargin: EdgeInsets.only(top:10, bottom: 10)),
          Tab(icon: ImageIcon(AssetImage('assets/images/verified.png'), color: _tabController.index == 2?Colors.pink: Colors.grey[800]),
              text: 'Closed', iconMargin: EdgeInsets.only(top:10, bottom: 10)),
        ]);
  }
}
