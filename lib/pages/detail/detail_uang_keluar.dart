import 'package:flutter/material.dart';

class DetailsUangKeluarPages extends StatelessWidget {
  final uangKeluar;

  DetailsUangKeluarPages({@required this.uangKeluar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Expenses Fee'),
        backgroundColor: Colors.orange[400],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                height: 250,
                width: 250,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: Text(
                      '${uangKeluar.nama_barang}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Rp.' + uangKeluar.harga),
                    trailing: Column(children: [Text('${uangKeluar.tanggal_pembelian}')]),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('${uangKeluar.metode_pembayaran}')
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.orange)),
                  child: const Center(
                    child: Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
