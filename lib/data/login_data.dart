import 'package:http/http.dart';

class LoginApi{

  Future getLoginData() async {
    var loginData = await get(Uri.parse('https://run.mocky.io/v3/67236f08-9312-4f15-b3bf-6899e2954324'));
    print('loginData: $loginData');
    return loginData;
  }
}