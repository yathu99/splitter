import 'dart:math';
import 'package:splitter/models/expense.dart';
import 'package:splitter/models/isar_models.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

var logger = Logger();
final isar = Isar.openSync([GroupsSchema, UserSchema]);
Future<Groups> createGroup(String groupName) async {
  final groups = isar.collection<Groups>();

  var lastGroup = groups.where(sort: Sort.desc).findFirstSync();

  var lastId =
      'G0A${Random(lastGroup!.id).toString().substring(0, 4)}${lastGroup.id}';

  //LastID to be generated from server

  final groupFormed = Groups()
    ..groupId = lastId
    ..groupName = groupName
    ..members = []
    ..expenses = [];

  return groupFormed;
}

Future<Expenses> createExpense(
    Group group, String newExpenseName, String newLocation) async {
  final groups = isar.collection<Groups>();
  try {
    var chosenGroup =
        groups.filter().groupIdEqualTo(group.groupId).findAllSync();
    var allExpenses = chosenGroup.first.expenses;
    var lastExpenses = chosenGroup.first.expenses?.last;
    for (int i = 0; i < allExpenses!.length; i += 1) {
      if (allExpenses[i].expenseName == newExpenseName) {
        throw Exception('Expense with existing name exists');
      }
    }

    var lastId =
        'E0A${Random(int.parse(lastExpenses!.expenseId!.substring(3, lastExpenses.expenseId!.length))).toString().substring(0, 4)}';

    return Expenses()
      ..expenseId = lastId
      ..expenseName = newExpenseName
      ..expenseAmount = 0
      ..expenseTimestamp = DateTime.now()
      ..expenseLocation = newLocation
      ..expenseMembers = []
      ..expenseDistribution;
  } catch (e) {
    logger.e('Unable to create new Expense by name of $newExpenseName \n $e');
    throw ('Cannot create New Expense');
  }
}

void changeGroupName(Groups group, String newName) async {
  final groups = isar.collection<Groups>();
  try {
    await isar.writeTxn(() async {
      var fetchedGroup = groups.getSync(group.id);
      fetchedGroup?.groupName = newName;
      groups.put(fetchedGroup!);
    });
    logger.i('Changed ${group.groupId} name to ${group.groupName} from DB');
  } catch (e) {
    logger.e(
        'Failed to Changed ${group.groupId} name to ${group.groupName} from DB');
  }
}

void addMember(Groups group, User user) async {
  final groups = isar.collection<Groups>();
  var fetchedGroup = groups.getSync(group.id);
  fetchedGroup?.members?.add(user.userId!);
  groups.put(fetchedGroup!);
}

void removeMember(Groups group, User user) async {
  final groups = isar.collection<Groups>();
  try {
    await isar.writeTxn(() async {
      var fetchedGroup = groups.getSync(group.id);
      fetchedGroup?.members?.remove(user.userId!);
      groups.put(fetchedGroup!);
    });
    logger.i('Removed $user from DB');
  } catch (e) {
    logger.e('Failed to remove $user from DB');
  }
}

void addExpense(Groups group, Expenses expense) async {
  final groups = isar.collection<Groups>();
  try {
    await isar.writeTxn(() async {
      var fetchedGroup = groups.getSync(group.id);
      fetchedGroup?.expenses?.add(expense);
      groups.put(fetchedGroup!);
    });
    logger.i('Added ${expense.expenseName} from DB');
  } catch (e) {
    logger.e('Failed to Add ${expense.expenseName} from DB');
  }
}

void removeExpense(Groups group, Expenses expense) async {
  final groups = isar.collection<Groups>();
  try {
    await isar.writeTxn(() async {
      var fetchedGroup = groups.getSync(group.id);
      fetchedGroup?.expenses?.remove(expense);
      groups.put(fetchedGroup!);
    });
    logger.i('Added ${expense.expenseName} from DB');
  } catch (e) {
    logger.e('Failed to remove ${expense.expenseName} from DB');
  }
}

void addGroup(Groups group) async {
  final groups = isar.collection<Groups>();
  try {
    await isar.writeTxn(() async {
      await groups.put(group);
    });
    logger.i('Added ${group.groupId} from DB');
  } catch (e) {
    logger.e('Failed to add ${group.groupId} from DB');
  }
}

void deleteGroup(Groups group) async {
  try {
    final groups = isar.collection<Groups>();
    await isar.writeTxn(() async {
      groups.delete(group.id);
    });
    logger.i('Deleted ${group.groupId} from DB');
  } catch (e) {
    logger.e('Failed to delete ${group.groupId} from DB \n $e');
  }
}

void showData() async {
  final isar = await Isar.open([GroupsSchema, UserSchema]);
  final groups = isar.collection<Groups>();
  final users = isar.collection<User>();
  var pols = groups.filter().idGreaterThan(0).findAllSync();
  var pos = users.filter().idGreaterThan(0).findAllSync();
  if (pols.isNotEmpty) {
    logger.d(pols.first.groupId);
  }
  if (pos.isNotEmpty) {
    logger.d(pos.first.phoneNo);
  }
}

void removeAllRecords() async {
  final isar = await Isar.open([GroupsSchema, UserSchema]);
  final groups = isar.collection<Groups>();
  final users = isar.collection<User>();

  await isar.writeTxn(() async {
    await groups.filter().idGreaterThan(0).deleteAll();
    await users.filter().idGreaterThan(0).deleteAll();
  });
}

void dbInitialInsertion() async {
  final isar = await Isar.open([GroupsSchema, UserSchema]);

  final groups = isar.collection<Groups>();
  final users = isar.collection<User>();

  final userObj = User()
    ..userId = 'U0A00001'
    ..phoneNo = '9876543210'
    ..balance = 20.0;

  final userObj1 = User()
    ..userId = 'U0A00002'
    ..phoneNo = '9834567810'
    ..balance = 130.0;

  final userObj2 = User()
    ..userId = 'U0A00003'
    ..phoneNo = '6543989911'
    ..balance = 9000.0;

  final expenseObj = Expenses()
    ..expenseId = 'E0A00001'
    ..expenseName = 'Food'
    ..expenseAmount = 120
    ..expenseTimestamp = DateTime.now()
    ..expenseLocation = 'Sau Paulo'
    ..expenseMembers = [userObj.userId!, userObj.userId!]
    ..expenseDistribution = null;

  final expenseObj1 = Expenses()
    ..expenseId = 'E0A00002'
    ..expenseName = 'Books'
    ..expenseAmount = 400
    ..expenseTimestamp = DateTime.now()
    ..expenseLocation = 'Smriti Garden'
    ..expenseMembers = [userObj1.userId!]
    ..expenseDistribution = null;

  final expenseObj2 = Expenses()
    ..expenseId = 'E0A00003'
    ..expenseName = 'Parking'
    ..expenseAmount = 15
    ..expenseTimestamp = DateTime.now()
    ..expenseLocation = 'Boji Temple'
    ..expenseMembers = [userObj2.userId!]
    ..expenseDistribution = null;

  final grpDataObj = Groups()
    ..groupId = 'G0A00001'
    ..groupName = 'Group1'
    ..expenses = [expenseObj, expenseObj1]
    ..members = [userObj.userId!, userObj2.userId!];

  final grpDataObj1 = Groups()
    ..groupId = 'G0A00002'
    ..groupName = 'Group2'
    ..expenses = [expenseObj2]
    ..members = [userObj1.userId!];

  await isar.writeTxn(() async {
    await users.put(userObj);
    await users.put(userObj1);
    await users.put(userObj2);

    await groups.put(grpDataObj);
    await groups.put(grpDataObj1);
  });

  //final favorites = await groups.get(1);
}
