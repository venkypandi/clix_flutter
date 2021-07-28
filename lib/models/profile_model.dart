class ProfileModel{
  String? firstName;
  String? middleName;
  String? lastName;
  String? profilePic;
  String? customerId;
  String? mobileNo;
  String? panNumber;
  String? dob;
  String? email;
  String? address;

  ProfileModel({this.firstName,
    this.middleName,
    this.lastName,
    this.profilePic,
    this.customerId,
    this.mobileNo,
    this.panNumber,
    this.dob,
    this.email,
    this.address});

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return new ProfileModel(
      firstName: map['first_name'] as String?,
      middleName: map['middle_name'] as String?,
      lastName: map['last_name'] as String?,
      profilePic: map['profile_pic'] as String?,
      customerId: map['customer_id'] as String?,
      mobileNo: map['mobile_no'] as String?,
      panNumber: map['pan_number'] as String?,
      dob: map['dob'] as String?,
      email: map['email'] as String?,
      address: map['address'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'firstName': this.firstName,
      'middleName': this.middleName,
      'lastName': this.lastName,
      'profilePic': this.profilePic,
      'customerId': this.customerId,
      'mobileNo': this.mobileNo,
      'panNumber': this.panNumber,
      'dob': this.dob,
      'email': this.email,
      'address': this.address,
    } as Map<String, dynamic>;
  }
}