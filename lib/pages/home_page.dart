import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import '../components/group_tile.dart';
import '../models/isar_models.dart';
import '../services/db_commands.dart';

var logger = Logger();
final isar = Isar.openSync([GroupsSchema]);
List<Groups>? groupNames;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<Groups>> generateInstancesFromDB() async {
  return await isar.collection<Groups>().where().findAll();
}

class _HomePageState extends State<HomePage> {
  bool groupsLoading = true;
  @override
  void initState() {
    dbInitialInsertion();
    //showData();
    generateInstancesFromDB().whenComplete(() async {
      groupNames = await generateInstancesFromDB();
      setState(() {
        groupsLoading = false;
      });
    });
    super.initState();
  }

  final TextEditingController _textFieldController = TextEditingController();
  late String valueText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splitter'), actions: [
        IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'New Group',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Create a new group'),
                    content: TextField(
                      onChanged: (value) {
                        setState(() {
                          valueText = value;
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          FocusManager.instance.primaryFocus?.unfocus();
                          //groupNames.add(valueText);
                          Navigator.pop(context);
                        });
                      },
                      controller: _textFieldController,
                      decoration: const InputDecoration(hintText: "Group Name"),
                    ),
                    actions: [
                      MaterialButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: const Text('OK'),
                          onPressed: () {
                            setState(() {
                              FocusManager.instance.primaryFocus?.unfocus();
                              //groupNames.add(valueText);
                              Navigator.pop(context);
                            });
                          })
                    ],
                  );
                },
              );
            }),
      ]),
      body: Column(
        children: [
          groupsLoading
              ? const CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                      itemCount: groupNames?.length,
                      itemBuilder: (context, index) => GroupTile(
                            groupName: groupNames![index].groupName!,
                          )),
                )
        ],
      ),
    );
  }
}
