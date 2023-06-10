import 'package:flutter/material.dart';
import 'package:flutter_application/services/uang_keluar_service.dart';

class UangKeluarProvider with ChangeNotifier {
  Future<bool> uangKeluar(
    String token,
    String kategori_id,
    String nama_barang,
    String harga,
    String metode_pembayaran,
    String tanggal_pembelian,
  ) async {
    try {
      if (await UangKeluarService().uangKeluar(
        token,
        kategori_id,
        nama_barang,
        harga,
        metode_pembayaran,
        tanggal_pembelian,
      )) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}
