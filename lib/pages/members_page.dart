import 'package:flutter/material.dart';
import 'package:splitter/components/member_tile.dart';

var users = ['Member 1', 'Member 2', 'Member 3', 'Member 4'];

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text(
            'Group Members',
            style:
                TextStyle(color: Colors.black, backgroundColor: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => MemberTile(
                  username: users[index],
                )));
  }
}

/*
The entered Password is invalid. Please enter a valid Password.
Password Guidelines
Password should be minimum of 6 characters and maximum of 16 characters.
Must have at least one uppercase letter, one lowercase letter, one numeric and one special character.
Special characters allowed !, @, #, $, %, &, *, (, ),_.
Password should not contain your first name.
Password should not start with a special character.*/
