import 'package:flutter/material.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_application/providers/uang_keluar_provider.dart';
import 'package:flutter_application/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

class UangKeluarPage extends StatefulWidget {
  @override
  State<UangKeluarPage> createState() => _UangKeluarPageState();
}

class _UangKeluarPageState extends State<UangKeluarPage> {
  TextEditingController namaBarangController = TextEditingController(text: '');

  TextEditingController kategoriBarangController =
      TextEditingController(text: '');

  TextEditingController hargaBarangController = TextEditingController(text: '');

  TextEditingController metodePembayaranController =
      TextEditingController(text: '');

  TextEditingController tanggalPembelianController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UangKeluarProvider uangKeluarProvider =
        Provider.of<UangKeluarProvider>(context);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Expenses Fee',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Add New Expenses Fee to Continue',
              style: secondaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget namaBarangInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name Product',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColorform,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.assignment_outlined,
                      color: orangeColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: namaBarangController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Name Product',
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    final List<String> items = ['Select Category','Belanja Umum'];
    String selectedValue;

    Widget kategoriBarangInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Product',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColorform,
                borderRadius: BorderRadius.circular(12),
              ),
              // child: Center(
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.category_outlined,
              //         color: orangeColor,
              //       ),
              //       SizedBox(
              //         width: 16,
              //       ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                    isExpanded: true,
                    hint: Row(
                      children: [
                        Icon(
                          Icons.list,
                          size: 25,
                          color: orangeColor,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: kategoriBarangController,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Enter Category Product',
                              hintStyle: subtitleTextStyle,
                              border: InputBorder.none,
                            ),
                            // 'Select Category Product',
                            // style: subtitleTextStyle,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                    items: items
                        .map((item) => DropdownMenuItem(
                              child: Text(
                                item,
                                style: primaryTextStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 45,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: backgroundColorform,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 45,
                      width: 200,
                      padding: null,
                      decoration: BoxDecoration(
                        color: backgroundColorform,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )),
              ),
              // Expanded(
              //   child: TextFormField(
              //     style: primaryTextStyle,
              //     controller: kategoriBarangController,
              //     decoration: InputDecoration.collapsed(
              //       hintText: 'Enter Category Product',
              //       hintStyle: subtitleTextStyle,
              //       border: InputBorder.none,
              //     ),
              //   ),
              // )
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      );
    }

    Widget hargaBarangInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColorform,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: orangeColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: hargaBarangController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Price',
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    //var _value = "-1";

    // Widget metodePembayaranController() {
    //   return Container(
    //     margin: EdgeInsets.only(top: 10),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         DropdownButtonFormField(
    //           value: _value,
    //           items: [
    //             DropdownMenuItem(
    //               child: Text("-Select Method Payment"),
    //               value: "-1",
    //             ),
    //             DropdownMenuItem(
    //               child: Text("Cash"),
    //               value: "-1",
    //             ),
    //             DropdownMenuItem(
    //               child: Text("GoPay"),
    //               value: "-2",
    //             ),
    //             DropdownMenuItem(
    //               child: Text("ShopePay"),
    //               value: "-3",
    //             ),
    //             DropdownMenuItem(
    //               child: Text("Transfer"),
    //               value: "-4",
    //             ),
    //             DropdownMenuItem(
    //               child: Text("Dana"),
    //               value: "-5",
    //             ),
    //           ],
    //         )
    //       ],
    //     ),
    //   );
    //}

    Widget metodePembayaranInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Method Payment',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColorform,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.payment_outlined,
                      color: orangeColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: metodePembayaranController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Method Payment',
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget tanggalPembelianInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: backgroundColorform,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: orangeColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: tanggalPembelianController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'yyyy-mm-dd',
                          hintStyle: subtitleTextStyle,
                          border: InputBorder.none,
                        ),
                        onTap: () async {
                          DateTime pickdate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2025));
                          if (pickdate != null) {
                            setState(() {
                              tanggalPembelianController.text =
                                  DateFormat('yyyy-MM-dd').format(pickdate);
                            });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    handleSubmit() async {
      if (await uangKeluarProvider.uangKeluar(
        authProvider.user.token,
        kategoriBarangController.text,
        namaBarangController.text,
        hargaBarangController.text,
        metodePembayaranController.text,
        tanggalPembelianController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Expenses Fee Created',
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, '/success-money-out', (route) => false);
      }
    }

    Widget saveButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: TextButton(
          onPressed: () {
            handleSubmit();
          },
          style: TextButton.styleFrom(
            backgroundColor: orangeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'Save',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: SpeedDial(
          icon: Icons.mode_rounded,
          backgroundColor: orangeColor,
          overlayColor: orangeColor,
          overlayOpacity: 0.4,
          children: [
            SpeedDialChild(
              child: Icon(Icons.add_rounded),
              label: 'Admission Fee',
              //backgroundColor: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, '/uang-masuk');
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.home_outlined),
              label: 'Home',
              onTap: () => Navigator.pushNamed(context, '/home'),
              //backgroundColor: Colors.red,
            )
          ],
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            children: [
              header(),
              namaBarangInput(),
              kategoriBarangInput(),
              hargaBarangInput(),
              metodePembayaranInput(),
              tanggalPembelianInput(),
              saveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
