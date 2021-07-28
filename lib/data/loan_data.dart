import 'package:http/http.dart';

class LoanApi{

  Future getActiveLoanData() async {
    var activeLoanData = await get(Uri.parse('https://run.mocky.io/v3/9cab9752-879b-45d8-868a-68b45f72df9a'));
    return activeLoanData;
  }

  Future getIncompleteLoanData() async{
    var incompleteLoanData = await get(Uri.parse('https://run.mocky.io/v3/446f5c1c-bbeb-46f3-bd52-01f9a7db1c5d'));
    return incompleteLoanData;
  }

  Future getClosedLoanData() async{
    var closedLoanData = await get(Uri.parse('https://run.mocky.io/v3/446f5c1c-bbeb-46f3-bd52-01f9a7db1c5d'));
    return closedLoanData;
  }

}
