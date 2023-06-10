import 'package:flutter/material.dart';
import 'package:flutter_application/pages/keluar/main_page.dart';
import 'package:flutter_application/pages/home/main_page.dart';
import 'package:flutter_application/pages/masuk/main_page.dart';
import 'package:flutter_application/pages/profile_page.dart';
import 'package:flutter_application/pages/sign_in_page.dart';
import 'package:flutter_application/pages/sign_up_page.dart';
import 'package:flutter_application/pages/splash_login.dart';
import 'package:flutter_application/pages/splash_page.dart';
import 'package:flutter_application/pages/success_page.dart';
import 'package:flutter_application/pages/success_uangkeluar_page.dart';
import 'package:flutter_application/providers/auth_provider.dart';
import 'package:flutter_application/providers/get_uang_keluar_provider.dart';
import 'package:flutter_application/providers/get_uang_masuk_provider.dart';
import 'package:flutter_application/providers/uang_keluar_provider.dart';
import 'package:flutter_application/providers/uang_masuk_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UangMasukProvider()),
        ChangeNotifierProvider(create: (context) => UangKeluarProvider()),
        ChangeNotifierProvider(create: (context) => GetUangMasukProvider()),
        ChangeNotifierProvider(create: (context) => GetUangKeluarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/uang-masuk' : (context) => UangMasuk(),
          '/splash-login' : (context) => SplashLoginPage(),
          '/home': (context) => MainPage(),
          '/uang-keluar': (context) => UangKeluarPage(),
          '/success': (context) => SuccessPage(),
          '/success-money-out' : (context) => SuccessMoneyOutPage(),
          '/profile' : (context) => ProfilePageScreen(),
        },
      ),
    );
  }
}
