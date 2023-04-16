import 'package:flutter/material.dart';

class MemberTile extends StatefulWidget {
  MemberTile({super.key, required this.username});
  late String username;
  @override
  State<MemberTile> createState() => _MemberTileState();
}

class _MemberTileState extends State<MemberTile> {
  late bool valueChange = true;

  @override
  void initState() {
    super.initState();
    valueChange = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        children: [
          Checkbox(
              activeColor: Colors.white,
              hoverColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              checkColor: Colors.black,
              value: valueChange,
              onChanged: (newValue) {
                setState(() {
                  valueChange = newValue!;
                });
              }),
          Text(
            widget.username,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
