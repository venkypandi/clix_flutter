import 'dart:convert';

import 'package:flutterdemo/data/dashboard_data.dart';
import 'package:flutterdemo/models/dashboard_model.dart';

class DashboardRepository{

  late DashboardModel dashboardModel;
  final String customerId;

  DashboardRepository({required this.customerId});

  getDashboardModelData() async {
    var response = await DashboardApi().getDashboardData();
    var jsonData = jsonDecode(response.body);

    jsonData['active'].forEach((element) {
      if(element['customer_id'] == customerId) {
        dashboardModel = DashboardModel.fromMap(element);
      }
    });
  }
}