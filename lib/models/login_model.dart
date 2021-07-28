class LoginModel {
  String customerId;
  String mobileNumber;
  String panNumber;
  String lanNumber;
  String otp;
  bool checkAuth;

  LoginModel({
    required this.customerId,
    required this.mobileNumber,
    required this.panNumber,
    required this.lanNumber,
    required this.otp,
    required this.checkAuth});
}