import 'package:flutter/material.dart';
import 'package:splitter/components/expense_tile.dart';
import 'package:splitter/pages/group_page.dart';

class GroupTile extends StatefulWidget {
  const GroupTile({super.key, required this.groupName});
  final String groupName;
  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.groupName),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GroupPage()));
        },
      ),
    );
  }
}
