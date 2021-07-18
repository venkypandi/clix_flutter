class ActiveLoanModel{
  String name;
  String icon;
  String status;
  String amount;
  String emi;
  String tenure;
  String dueDate;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  ActiveLoanModel({
    required this.name,
    required this.icon,
    required this.status,
    required this.amount,
    required this.emi,
    required this.tenure,
    required this.dueDate,
  });

  factory ActiveLoanModel.fromMap(Map<String, dynamic> map) {
    return new ActiveLoanModel(
      name: map['name'] as String,
      icon: map['icon'] as String,
      status: map['status'] as String,
      amount: map['amount'] as String,
      emi: map['emi'] as String,
      tenure: map['tenure'] as String,
      dueDate: map['dueDate'] as String,
    );
  }

//</editor-fold>

}


class IncompleteLoanModel{
  String applicationDate;
  String applicationId;

  IncompleteLoanModel({
    required this.applicationDate,
    required this.applicationId,
  });

  factory IncompleteLoanModel.fromMap(Map<String, dynamic> map) {
    return new IncompleteLoanModel(
      applicationDate: map['application_date'] as String,
      applicationId: map['application_id'] as String,
    );
  }
}


class ClosedLoanModel{
  String loanAmount;
  String tenure;

  ClosedLoanModel({
    required this.loanAmount,
    required this.tenure,
  });

  factory ClosedLoanModel.fromMap(Map<String, dynamic> map) {
    return new ClosedLoanModel(
      loanAmount: map['loan_amount'] as String,
      tenure: map['tenure'] as String,
    );
  }
}
