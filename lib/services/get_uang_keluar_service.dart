import 'dart:convert';
import 'package:flutter_application/models/money_out_model.dart';
import 'package:http/http.dart' as http;

class GetKeluarService {
  String baseUrl = 'https://api-keuangan.wikukarno.id/api';

  Future<List<MoneyOutModel>> getUangKeluar(String token) async {
    var url = '$baseUrl/uang-keluar';
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
      List<MoneyOutModel> uangkeluar = [];

      for (var item in data) {
        uangkeluar.add(MoneyOutModel.fromJson(item));
      }

      return uangkeluar;
    } else {
      throw Exception('Gagal Mengambil Data Uang Keluar!');
    }
  }
}
