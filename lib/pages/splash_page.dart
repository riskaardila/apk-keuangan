import 'dart:async';

import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/sign-in'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 250,
              height: 250,
            ),

            const SizedBox(
              height: 5,
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


// class SplashPage extends StatefulWidget {
//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     // TODO: implement initState

//     Timer(
//       Duration(seconds: 3),
//       () => Navigator.pushNamed(context, '/sign-in'),
//     );

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Container(
//           width: 130,
//           height: 150,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(
//                 'assets/logo.png',
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
