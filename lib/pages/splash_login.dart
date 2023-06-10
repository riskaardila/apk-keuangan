import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home/main_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashLoginPage extends StatefulWidget {
  const SplashLoginPage({Key key}) : super(key: key);

  @override
  State<SplashLoginPage> createState() => _SplashLoginPageState();
}

class _SplashLoginPageState extends State<SplashLoginPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/aset.png',
              width: 250,
              height: 250,
            ),
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.orange[400],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            loading()
            // Text('data', style: TextStyle(color:Colors.black,fontSize: 12.0,fontWeight: FontWeight.normal),)
          ],
        ),
      ),
    );
  }

  Widget loading() {
    return LoadingAnimationWidget.inkDrop(
      color: Colors.orange,
      size: 30,
    );
  }
}
