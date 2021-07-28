import 'package:http/http.dart';

class ProfileApi{

  Future getProfileData() async {
    var profileData = await get(Uri.parse('https://run.mocky.io/v3/4e241a6d-7b3f-4470-97e0-098b779613c5'));
    print("profileData: $profileData");
    return profileData;
  }
}