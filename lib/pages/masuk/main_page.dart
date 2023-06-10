import 'package:flutter/material.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/uang_masuk_provider.dart';
import 'package:flutter_application/theme.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UangMasuk extends StatefulWidget {
  @override
  State<UangMasuk> createState() => _UangMasukState();
}

class _UangMasukState extends State<UangMasuk> {
  TextEditingController nameController = TextEditingController(text: '');

  TextEditingController descriptionController = TextEditingController(text: '');

  TextEditingController priceController = TextEditingController(text: '');

  TextEditingController dateController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    UangMasukProvider uangMasukProvider =
        Provider.of<UangMasukProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSubmit() async {
      if (await uangMasukProvider.uangMasuk(
        authProvider.user.token,
        nameController.text,
        descriptionController.text,
        priceController.text,
        dateController.text,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Admission Fee Created',
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamedAndRemoveUntil(
            context, '/success', (route) => false);
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Admission Fee',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Add New Admission Fee to Continue',
              style: secondaryTextStyle,
            ),
          ],
        ),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Admission Fee',
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
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: nameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Admission Fee',
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

    Widget priceInput() {
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
                      width: 8,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: priceController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Admission Fee',
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

    Widget descriptionInput() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
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
                      Icons.description,
                      color: orangeColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: descriptionController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Enter Description',
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

    // make choose date picker
    Widget dateInput() {
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
                        controller: dateController,
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
                              dateController.text =
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
              child: Icon(Icons.add_card_rounded),
              label: 'Expenses Fee',
              //backgroundColor: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, '/uang-keluar');
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
              nameInput(),
              priceInput(),
              descriptionInput(),
              dateInput(),
              saveButton(),
            ],
          ),
        ),
      ),
    );
  }
}
