import 'dart:convert';

import 'package:http/http.dart' as http;

class UangKeluarService {
  String baseUrl = 'https://api-keuangan.wikukarno.id/api';

  Future uangKeluar(String token, 
    kategori_id,
    nama_barang,
    harga,
    metode_pembayaran,
    tanggal_pembelian,
  ) async {
    var url = '$baseUrl/uang-keluar/store';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      'kategori_id': kategori_id,
      'nama_barang': nama_barang,
      'harga': harga,
      'metode_pembayaran': metode_pembayaran,
      'tanggal_pembelian': tanggal_pembelian,
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
      throw Exception('Gagal Membuat Uang Keluar!');
    }
  }
}
