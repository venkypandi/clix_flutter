import 'dart:convert';

import 'package:flutterdemo/data/loan_data.dart';
import 'package:flutterdemo/models/loan_model.dart';


class LoanRepository{

  List<ActiveLoanModel> modelData = [];

  Future<List<ActiveLoanModel>> getActiveLoanModelData() async {
    var loanApi = LoanApi();
    var response = await loanApi.getActiveLoanData();
    var jsonData = jsonDecode(response.body);

    print(jsonData["loans"]);

    jsonData["loans"].forEach((element){
      ActiveLoanModel activeLoanModel = ActiveLoanModel.fromMap(element);

      modelData.add(activeLoanModel);

    });
    // print("model: $modelData.toString");
    return modelData;
  }

  Future<IncompleteLoanModel> getIncompleteLoanModelData() async {
    var loanApi = LoanApi();
    var response = await loanApi.getIncompleteLoanData();
    var jsonData = jsonDecode(response.body);

    var element = jsonData["incomplete"];
    IncompleteLoanModel applicationModel = IncompleteLoanModel.fromMap(element);
    // print("applModel: $applicationModel");
    return applicationModel;

  }

  Future<ClosedLoanModel> getClosedLoanModelData() async {
    var loanApi = LoanApi();
    var response = await loanApi.getClosedLoanData();
    var jsonData = jsonDecode(response.body);

    var element = jsonData["closed"];
    ClosedLoanModel loanModel = ClosedLoanModel.fromMap(element);
    // print("closedModel: $loanModel");
    return loanModel;
  }

}
