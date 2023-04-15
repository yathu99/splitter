import 'package:flutter/material.dart';

class Member {
  final String name;
  final String memberID;
  final String tag;
  final Image avatarImage;

  Member(this.name, this.memberID, this.tag, this.avatarImage);
}

class Group {
  final String groupName;
  final String groupId;
  final List<Member> members;
  final List<Expense> expenses;

  Group(this.groupName, this.groupId, this.members, this.expenses);
}

class Expense {
  final String expenseName;
  final double expenseValue;
  final DateTime expenseDate;
  final String expenseLocation;
  final List<Member> membersOfExpense;
  Expense(this.expenseName, this.expenseValue, this.expenseDate,
      this.expenseLocation, this.membersOfExpense);
}
