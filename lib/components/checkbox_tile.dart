import 'package:flutter/material.dart';

class MemberCheckTile extends StatefulWidget {
  const MemberCheckTile({super.key});

  @override
  State<MemberCheckTile> createState() => _MemberCheckTileState();
}

class _MemberCheckTileState extends State<MemberCheckTile> {
  late bool _checked;

  @override
  void initState() {
    super.initState();
    _checked = false;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: const Text('Member 1'),
      value: _checked,
      onChanged: (newValue) {
        setState(() {
          _checked = newValue!;
        });
      },
    );
  }
}
