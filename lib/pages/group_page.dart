import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:splitter/components/expense_tile.dart';
import 'package:splitter/components/pie_chart_tile.dart';
import 'package:splitter/models/isar_models.dart';
import 'package:splitter/models/pie_data.dart';
import 'package:splitter/pages/members_page.dart';
import 'package:splitter/services/db_commands.dart';

List<PieDisplayGroupData> pieChartsValue = [];

var logger = Logger();
late List<Expenses> expenses;

List<PieDisplayGroupData> groupDataEval(List<Expenses> expenseList) {
  late List displayExpensesPie = [];
  for (int i = 0; i < expenseList.length; i++) {
    displayExpensesPie.add(PieDisplayGroupData(
        expenseList[i].expenseName!, expenseList[i].expenseAmount!));
  }

  return displayExpensesPie.cast<PieDisplayGroupData>();
}

void getExpenses(Groups group) async {
  expenses = group.expenses!;
}

class GroupPage extends StatefulWidget {
  const GroupPage({super.key, required this.group});
  final Groups group;
  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  void initState() {
    super.initState();
    getExpenses(widget.group);
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
        title: Text(widget.group.groupName!),
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
            icon: const Icon(Icons.monetization_on),
            tooltip: 'Add New Expense',
          ),
          IconButton(
            onPressed: () {
              deleteGroup(widget.group);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
            tooltip: 'Delete Group',
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
                SizedBox(
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
                  expenseName: expenses[index].expenseName!,
                  expenseAmount: expenses[index].expenseAmount.toString(),
                  expenseLocation: expenses[index].expenseLocation!,
                  expenseTimeStamp:
                      expenses[index].expenseTimestamp.toString()),
            ),
          )),
        ],
      ),
    );
  }
}
