class DashboardModel {
  String? firstName;
  String? lastName;
  String? profilePic;
  String customerId;
  String? gender;
  String? loanId;
  String? loanCategory;
  double loanAmount;
  String? dueDate;
  int creditScore;
  String? creditScoreDate;

  DashboardModel({
    required this.firstName,
    required this.lastName,
    required this.profilePic,
    required this.customerId,
    required this.gender,
    required this.loanId,
    required this.loanCategory,
    required this.loanAmount,
    required this.dueDate,
    required this.creditScore,
    required this.creditScoreDate});

  factory DashboardModel.fromMap(Map<String, dynamic> map) {
    return new DashboardModel(
      firstName: map['first_name'] as String?,
      lastName: map['last_name'] as String?,
      profilePic: map['profile_pic'] as String?,
      customerId: map['customer_id'] as String,
      gender: map['gender'] as String?,
      loanId: map['loan_id'] as String?,
      loanCategory: map['loan_category'] as String?,
      loanAmount: map['loan_amount'] as double,
      dueDate: map['due_date'] as String?,
      creditScore: map['credit_score'] as int,
      creditScoreDate: map['credit_score_date'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'profilePic': this.profilePic,
      'customerId': this.customerId,
      'gender': this.gender,
      'loanId': this.loanId,
      'loanCategory': this.loanCategory,
      'loanAmount': this.loanAmount,
      'dueDate': this.dueDate,
      'creditScore': this.creditScore,
      'creditScoreDate': this.creditScoreDate,
    } as Map<String, dynamic>;
  }
}