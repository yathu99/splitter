import 'package:flutter/material.dart';
import 'package:splitter/services/db_commands.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String loginServiceURL = "http://10.0.2.2:3000/";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginForm(),
    );
  }
}

class Album {
  final String data;

  const Album({required this.data});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      data: json['data'],
    );
  }

  getTitle() {
    return data;
  }
}

Future<Album> createRequest(String user) async {
  final response = await http
      .post(Uri.parse(loginServiceURL),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'data': user,
          }))
      .catchError((oneError) {
    logger.e(oneError.toString());
    return '';
  });

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  }
  if (response.statusCode == 404) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    throw Exception('Error! Resource not found');
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _passwordController;
  late String username = "";
  late String password;

  @override
  void initState() {
    super.initState();
    username = "POLY";
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isEmailValid(String? email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
            child: Column(
          children: [
            Container(height: 180),

            //Username Field Widget
            Container(
              padding: const EdgeInsetsDirectional.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: TextFormField(
                autofocus: true,
                validator: (email) {
                  if (!(email == null || email.isEmpty)) {
                    //if (isEmailValid(email)) {
                    return null;
                  } else {
                    return 'Enter a valid username';
                  }
                },
                //onChanged: (value) => _usernameController.text = value,
                decoration: const InputDecoration(
                    hintText: 'Username or Email',
                    //errorText: 'Incorrect Username or Email',
                    border: OutlineInputBorder()),
                controller: _usernameController,
              ),
            ),
            const SizedBox(
              height: 12,
            ),

            //  Password Field Widget
            Container(
              padding: const EdgeInsetsDirectional.all(8),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              child: TextFormField(
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                //onChanged: (value) => _passwordController.text = value,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    //errorText: 'Incorrect Password',
                    border: OutlineInputBorder()),
                controller: _passwordController,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //const CircularProgressIndicator(),
            MaterialButton(
                color: Colors.indigo.shade400,
                child: const Text('CHECK'),
                onPressed: () {
                  createRequest(_usernameController.text).then((value) => {
                        setState(() {
                          username = value.getTitle();
                        })
                      });
                }),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(12),
              child: Text(
                username,
                style: const TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
          ],
        ))
      ],
    );
  }
}


/*
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(height: 200),
          Container(
            padding: const EdgeInsetsDirectional.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: TextField(
              autofocus: true,
              onChanged: (value) => _usernameController.text = value,
              decoration: const InputDecoration(
                  hintText: 'Username or Email', border: OutlineInputBorder()),
              controller: _usernameController,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsetsDirectional.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.shade200,
            ),
            child: TextField(
              autofocus: true,
              onChanged: (value) => _passwordController.text = value,
              decoration: const InputDecoration(
                  hintText: 'Password', border: OutlineInputBorder()),
              controller: _passwordController,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          // Container(
          //   width: double.infinity,
          //   margin: const EdgeInsets.all(20),
          //   decoration: BoxDecoration(
          //       color: Colors.indigo[700],
          //       borderRadius: BorderRadius.circular(8)),
          //   padding: const EdgeInsets.all(8),
          //   child:
          MaterialButton(
            onPressed: () {},
            color: Colors.limeAccent[400],
            height: 28,
            textColor: Colors.blue[900],
            padding: EdgeInsets.all(18),
            minWidth: 380,
            child: const Text(
              'LOG IN',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          //)
        ],
      ),
    );
  }
}
*/
