import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addQuotation(Map<String, dynamic> quotationInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("quotation")
        .doc()
        .set(quotationInfoMap);
  }

  Future addLr(Map<String, dynamic> lrInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("lr")
        .doc()
        .set(lrInfoMap);
  }

  Future addBill(Map<String, dynamic> billInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("bill")
        .doc()
        .set(billInfoMap);
  }

  Future addMoneyReceipt(Map<String, dynamic> moneyReceiptInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("moneyReceipt")
        .doc()
        .set(moneyReceiptInfoMap);
  }
}
