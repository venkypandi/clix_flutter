import 'dart:convert';

import 'package:flutterdemo/data/profile_data.dart';
import 'package:flutterdemo/models/profile_model.dart';


class ProfileRepository{
  late ProfileModel profileModel;
  final String customerId;

  ProfileRepository({required this.customerId});

  Future<ProfileModel> getProfileModelData() async {
    var response = await ProfileApi().getProfileData();
    var jsonData = jsonDecode(response.body);

    // print("jsonDta: $jsonData");

    jsonData["profile"].forEach((element) {
      if (element['customer_id'] == customerId) {
        profileModel = ProfileModel.fromMap(element);
      }
    });
    print('profileModel:${profileModel.firstName}');
    return profileModel;
  }

}