import 'package:http/http.dart';

class DashboardApi{

  Future getDashboardData() async {
    var dashboardData = await get(Uri.parse('https://run.mocky.io/v3/7b54bc7b-3c4c-40d6-9d33-b1bad810fe52'));
    return dashboardData;
  }
}