import 'package:flutter/material.dart';
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:flutter_application/services/get_service.dart';

class GetUangMasukProvider with ChangeNotifier {
  List<AdmissionFeeModel> _uangMasuk = [];
  List<AdmissionFeeModel> get uangMasuk => _uangMasuk;

  set uangMasuk(List<AdmissionFeeModel> newUangMasuk) {
    _uangMasuk = newUangMasuk;
    notifyListeners();
  }

  Future<bool> getUangMasuk(String token) async {
    try {
      List<AdmissionFeeModel> uangMasuk = await GetMasukService().getUangMasuk(token);
      _uangMasuk = uangMasuk;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}