import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import '../components/group_tile.dart';
import '../models/isar_models.dart';
import '../services/db_commands.dart';

var logger = Logger();
//final isar = Isar.openSync([GroupsSchema, UserSchema]);
List<Groups>? groupNames;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<Groups>> generateInstancesFromDB() async {
  return await isar.collection<Groups>().where().findAll();
}

void createNewGroup(String newGroupName) async {
  FocusManager.instance.primaryFocus?.unfocus();
  final newGroup = await createGroup(newGroupName);
  addGroup(newGroup);

  groupNames!.add(newGroup);
}

class _HomePageState extends State<HomePage> {
  bool groupsLoading = true;
  @override
  void initState() {
    //removeAllRecords();
    //dbInitialInsertion();
    showData();
    generateInstancesFromDB().whenComplete(() async {
      groupNames = await generateInstancesFromDB();
      setState(() {
        groupsLoading = false;
        //logger.d(groupsLoading);
      });
    });
    super.initState();
  }

  final TextEditingController _textFieldController = TextEditingController();
  late String valueText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.amber[300],
        width: 300,
        child: Center(
            child: Column(children: const [
          SizedBox(
            height: 120,
            child: Center(child: Text('logo')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Divider(
              height: 10,
              thickness: 5,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.perm_contact_cal_rounded),
            title: Text('Saved Contacts'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ])),
      ),
      appBar: AppBar(title: const Text('Splitter'), actions: [
        IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'New Group',
            onPressed: () {
              valueText = '';
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
                          createNewGroup(valueText);
                          _textFieldController.clear();
                          Navigator.pop(context);
                        });
                      },
                      controller: _textFieldController,
                      decoration: const InputDecoration(hintText: "Group Name"),
                    ),
                    actions: [
                      MaterialButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: const Text('CANCEL'),
                          onPressed: () {
                            _textFieldController.clear();
                            Navigator.pop(context);
                          }),
                      MaterialButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: const Text('OK'),
                          onPressed: () {
                            setState(() {
                              createNewGroup(valueText);
                              _textFieldController.clear();
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
                            group: groupNames![index],
                          )),
                )
        ],
      ),
    );
  }
}
