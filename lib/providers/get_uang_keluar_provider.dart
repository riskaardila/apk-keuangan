import 'package:flutter/material.dart';
import 'package:flutter_application/models/money_out_model.dart';
import 'package:flutter_application/services/get_uang_keluar_service.dart';

class GetUangKeluarProvider with ChangeNotifier {
  List<MoneyOutModel> _uangKeluar = [];
  List<MoneyOutModel> get uangKeluar => _uangKeluar;

  set uangKeluar(List<MoneyOutModel> newUangKeluar) {
    _uangKeluar = newUangKeluar;
    notifyListeners();
  }

  Future<bool> getUangKeluar(String token) async {
    try {
      List<MoneyOutModel> uangKeluar = await GetKeluarService().getUangKeluar(token);
      _uangKeluar = uangKeluar;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}