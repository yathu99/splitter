import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:splitter/components/expense_tile.dart';
import 'package:splitter/components/pie_chart_tile.dart';
import 'package:splitter/models/pie_data.dart';
import 'package:splitter/pages/members_page.dart';

List<PieDisplayGroupData> pieChartsValue = [];

var logger = Logger();

var expenses = [
  {
    'expenseName': 'Food',
    'expenseAmount': '250',
    'expenseLocation': 'Sao Paulo, USA',
    'expenseTimeStamp': '10/04/2023\n13:01'
  },
  {
    'expenseName': 'Books',
    'expenseAmount': '600',
    'expenseLocation': '',
    'expenseTimeStamp': '10.04.2023T11:13:0004Z'
  },
  {
    'expenseName': 'Parking',
    'expenseAmount': '30',
    'expenseLocation': '',
    'expenseTimeStamp': '10.04.2023T20:45:0004Z'
  },
];

List<PieDisplayGroupData> groupDataEval(List expenseList) {
  late List displayExpensesPie = [];
  for (int i = 0; i < expenseList.length; i++) {
    displayExpensesPie.add(PieDisplayGroupData(expenseList[i]['expenseName'],
        int.parse(expenseList[i]['expenseAmount'])));
  }

  return displayExpensesPie.cast<PieDisplayGroupData>();
}

String propertyEval(Map<String, String> map, String property) {
  try {
    return map[property] ??= 'NO Data';
  } catch (exception) {
    logger.d('Error encountered --> \n $exception');
    return 'Data Not available';
  }
}

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});
  @override
  State<GroupPage> createState() => _GroupPageState();
}
/*
void showGroupValues(List<PieDisplayGroupData> pieDatar) {
  for (int i = 0; i < pieDatar.length; i++) {
    logger.d(pieDatar[i].expenseName.toString() + pieDatar[i].value.toString());
  }
}*/

class _GroupPageState extends State<GroupPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      pieChartsValue = groupDataEval(expenses);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: const Icon(Icons.keyboard_backspace)),
        title: const Text('Group 1'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MembersPage()));
            },
            icon: const Icon(Icons.group),
            tooltip: 'Members',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.group_add),
            tooltip: 'Add Member',
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            tooltip: 'Discard Group',
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 240,
            alignment: Alignment.topCenter,
            color: Colors.blue[100],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(child: PieChart(chartData: pieChartsValue)),
                const VerticalDivider(
                  width: 5,
                  color: Colors.black,
                ),
                Container(
                  width: 80,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Center(
                              child: Text(
                            '80',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )),
                          Text(
                            '60',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '20',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.black,
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) => ExpenseTile(
                  expenseName: propertyEval(expenses[index], 'expenseName'),
                  expenseAmount: propertyEval(expenses[index], 'expenseAmount'),
                  expenseLocation:
                      propertyEval(expenses[index], 'expenseLocation'),
                  expenseTimeStamp:
                      propertyEval(expenses[index], 'expenseTimeStamp')),
            ),
          )),
        ],
      ),
    );
  }
}
