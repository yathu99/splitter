import 'package:flutter/material.dart';
import 'package:splitter/models/isar_models.dart';
import 'package:splitter/pages/group_page.dart';

class GroupTile extends StatefulWidget {
  const GroupTile({super.key, required this.group});
  final Groups group;
  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(widget.group.groupName!),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroupPage(
                        group: widget.group,
                      )));
        },
      ),
    );
  }
}
