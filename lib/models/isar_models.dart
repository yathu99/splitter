import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
part 'isar_models.g.dart';

@collection
class Groups {
  //Groups(this.groupId, this.groupName, this.members, this.expenses);

  Id id = Isar.autoIncrement;
  String? groupId;
  String? groupName;
  List<String>? members;
  List<Expenses>? expenses;

  // void addUserToGroup(Isar isar, User userToAdd) async {
  //   await isar.writeTxn(() async {
  //     await isar.groups.put(this);
  //   });
  // }
}

@collection
class TempSavedContact {
  Id id = Isar.autoIncrement;
  List<String>? invitedUsers;
}

@collection
class SavedContacts {
  Id id = Isar.autoIncrement;
  List<String>? savedUsers;
}

@collection
class User {
  Id id = Isar.autoIncrement;
  String? userId;
  String? phoneNo;
  double? balance;
  @ignore
  Image? avatarImage;
}

@embedded
class Expenses {
  Expenses(
      {this.expenseId,
      this.expenseName,
      this.expenseAmount,
      this.expenseTimestamp,
      this.expenseLocation,
      this.expenseMembers,
      this.expenseDistribution});

  String? expenseId;
  String? expenseName;
  double? expenseAmount;
  DateTime? expenseTimestamp;
  String? expenseLocation;
  List<String>? expenseMembers;
  ExpenseDistribtion? expenseDistribution;
}

@embedded
class ExpenseDistribtion {
  ExpenseDistribtion({this.expenseId, this.distributionJson});
  String? expenseId;
  String? distributionJson;
}
