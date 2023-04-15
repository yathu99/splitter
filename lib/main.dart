import 'package:flutter/material.dart';
import 'package:splitter/pages/home_page.dart';
import 'package:splitter/pages/login_page.dart';
import 'package:splitter/pages/members_page.dart';

void main() async {
  //running application
  runApp(const Splitter());
}

class Splitter extends StatelessWidget {
  const Splitter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/login': (context) => const LoginPage(),
        '/members': (context) => const MembersPage(),
      },
    );
  }
}
