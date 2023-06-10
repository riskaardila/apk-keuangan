import 'dart:convert';
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:http/http.dart' as http;

class GetMasukService {
  String baseUrl = 'https://api-keuangan.wikukarno.id/api';

  Future<List<AdmissionFeeModel>> getUangMasuk(String token) async {
    var url = '$baseUrl/uang-masuk';
    var headers = {
      'Content-Type' : 'application/json',
      'Authorization' : "Bearer : " + token,
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<AdmissionFeeModel> uangMasuk = [];

      for (var item in data) {
        uangMasuk.add(AdmissionFeeModel.fromJson(item));
      }

      return uangMasuk;
    } else {
      throw Exception('Gagal Mengambil Data Uang Masuk!');
    }
  }
}
