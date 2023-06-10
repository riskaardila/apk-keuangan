import 'package:flutter_application/pages/detail/detail.dart';
import 'package:flutter_application/providers/get_uang_keluar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/get_uang_masuk_provider.dart';
import 'package:flutter_application/theme.dart';
import 'package:flutter_application/pages/detail/detail_uang_keluar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetUangMasukProvider getUangMasukProvider =
        Provider.of<GetUangMasukProvider>(context);
    GetUangKeluarProvider getUangKeluarProvider =
        Provider.of<GetUangKeluarProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      floatingActionButton: SpeedDial(
        icon: Icons.mode_rounded,
        backgroundColor: orangeColor,
        overlayColor: orangeColor,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add_rounded),
            label: 'Addmission Fee',
            //backgroundColor: Colors.green,
            onTap: () {
              Navigator.pushNamed(context, '/uang-masuk');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.add_card_outlined),
            label: 'Expenses Fee',
            onTap: () => Navigator.pushNamed(context, '/uang-keluar'),
            //backgroundColor: Colors.red,
          )
        ],
      ),
      appBar: AppBar(
        title: Text('Tensai Finance'),
        backgroundColor: Colors.orange[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Hi, Riska Ardila',
                            style: subtitleTextStyle,
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/profile');
                            },
                            icon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 50,
                          left: 50,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: const Text(
                                    'Addmission Fee',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                        future: getUangMasukProvider
                            .getUangMasuk(authProvider.user.token),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: getUangMasukProvider.uangMasuk.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: ListTile(
                                    title: Text(getUangMasukProvider
                                        .uangMasuk[index].name),
                                    subtitle: Text("Rp. " +
                                        getUangMasukProvider
                                            .uangMasuk[index].price),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsPages(
                                                        uangMasuk:
                                                            getUangMasukProvider
                                                                    .uangMasuk[
                                                                index])));
                                      },
                                      icon: Icon(Icons.remove_red_eye),
                                    ),
                                    tileColor: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.orange, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  margin: EdgeInsets.only(bottom: 10),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child:
                                  CircularProgressIndicator(color: orangeColor),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 50,
                          left: 50,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: const Text(
                                    'Expenses Fee',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                        future: getUangKeluarProvider
                            .getUangKeluar(authProvider.user.token),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount:
                                  getUangKeluarProvider.uangKeluar.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: ListTile(
                                    title: Text(getUangKeluarProvider
                                        .uangKeluar[index].nama_barang),
                                    subtitle: Text("Rp. " +
                                        getUangKeluarProvider
                                            .uangKeluar[index].harga),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsUangKeluarPages(uangKeluar: getUangKeluarProvider.uangKeluar[index])));
                                      },
                                      icon: Icon(Icons.remove_red_eye),
                                    ),
                                    tileColor: Colors.grey.shade200,
                                    shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.orange, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  margin: EdgeInsets.only(bottom: 10),
                                );
                              },
                            );
                          } else {
                            return Center(
                              child:
                                  CircularProgressIndicator(color: orangeColor),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
