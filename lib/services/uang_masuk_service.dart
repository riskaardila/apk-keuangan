import 'dart:convert';
import 'package:http/http.dart' as http;

class UangMasukService {
  String baseUrl = 'https://api-keuangan.wikukarno.id/api';

  Future uangMasuk(String token, name, description, price, date) async {
    var url = '$baseUrl/uang-masuk/store';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      'nama_masuk': name,
      'deskripsi': description,
      'harga_masuk': price,
      'tanggal_masuk': date,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Membuat Uang Masuk!');
    }
  }
}
