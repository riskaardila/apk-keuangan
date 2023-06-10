import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home/main_page.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Profile'),
        backgroundColor: Colors.orange[400],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/profile.png'),
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: const Text(
                            'Hi, Riska Ardila',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Update Profile',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.people_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Update Password',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.password_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'About',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.info_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Term Conditions',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.document_scanner_sharp,
                          color: Colors.black,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Rating Apps',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.star,
                          color: Colors.black,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainPage()));
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
                                'Batal',
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
              )
            ],
          )
        ],
      ),
    );
  }
}
