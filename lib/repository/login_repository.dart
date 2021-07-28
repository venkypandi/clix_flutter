import 'dart:convert';
import 'package:flutterdemo/data/login_data.dart';
import 'package:flutterdemo/models/login_model.dart';

class LoginRepository{
  bool checkAuth = false;
  late LoginModel loginModel;

  Future<LoginModel> getLoginAuth({required String mobile}) async {

    var response = await LoginApi().getLoginData();
    var jsonData = jsonDecode(response.body);

    jsonData['login'].forEach((element) {
      if(element['mobile_number'] == mobile) {
        print('check Auth : true');
        print('check Auth : ${element['mobile_number']}');
        loginModel = LoginModel(
            customerId : element['customer_id'],
            mobileNumber: element['mobile_number'],
            panNumber: element['pan_number'],
            lanNumber: element['lan_number'],
            otp: element['otp'], checkAuth: true);
        checkAuth = true;
      }
    });
    if(!checkAuth){
      loginModel = LoginModel(
          customerId : "",
          mobileNumber: "",
          panNumber: "",
          lanNumber: "",
          otp:"", checkAuth: false);
      checkAuth = false;
    }
    return loginModel;
  }
}