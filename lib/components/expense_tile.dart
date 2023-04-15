// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class ExpenseTile extends StatefulWidget {
  ExpenseTile(
      {super.key,
      required this.expenseName,
      required this.expenseAmount,
      required this.expenseLocation,
      required this.expenseTimeStamp});
  late String expenseName;
  late String expenseAmount;
  late String expenseLocation;
  late String expenseTimeStamp;
  late List<String>? members;
  @override
  State<ExpenseTile> createState() => _ExpenseTileState();
}

class _ExpenseTileState extends State<ExpenseTile> {
  late Color expandedBackground = Colors.grey.shade800;
  late Color expandedtileBackground = Colors.grey.shade600;
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    return ExpansionTile(
      textColor: Colors.white,
      collapsedBackgroundColor: Colors.black,
      collapsedTextColor: Colors.white,
      collapsedIconColor: Colors.white,
      title: Text(widget.expenseName),
      subtitle: Text('${widget.expenseAmount}\$'),
      controlAffinity: ListTileControlAffinity.trailing,
      trailing:
          IconButton(onPressed: () {}, icon: const Icon(Icons.group_outlined)),
      backgroundColor: Colors.deepPurple[900],
      children: [
        Container(
            height: 165, //120
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
            color: expandedBackground,
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: expandedtileBackground),
                            child: Center(
                                child: Text(
                              widget.expenseTimeStamp,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: expandedtileBackground),
                            child: Center(
                                child: Text(
                              widget.expenseLocation,
                              //widget.expenseLocation,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ),
                    //DELETE FROM HERE
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: expandedtileBackground),
                            child: Center(
                                child: Text(
                              widget.expenseTimeStamp,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          Container(
                            width: 150,
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: expandedtileBackground),
                            child: Center(
                                child: Text(
                              widget.expenseLocation,
                              //widget.expenseLocation,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                    ), //DELETE TILL HERE
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: expandedtileBackground),
                          child: Column(
                            children: [
                              Center(
                                  child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )),
                              const Divider(
                                height: 35,
                              ),
                              Center(
                                  child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  size: 24,
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              )),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
            ))
      ],
    );
  }
}
