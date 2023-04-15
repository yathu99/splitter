import 'package:splitter/models/isar_models.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';

var logger = Logger();

/*
Future<Isar> openIsarDB() async {
  return await Isar.open(
      [GroupsSchema, TempSavedContactSchema, SavedContactSchema, UserSchema]);
}

void showData() async {
  final isar = await Isar.open(
      [GroupsSchema, TempSavedContactSchema, SavedContactsSchema]);
  final groups = isar.collection<Groups>();
  var pols = await groups.filter().groupNameEndsWith('2').findAll();
  logger.d(pols.first.groupId);
}

void addGroup(Isar isar, Groups group) async {
  final groups = isar.collection<Groups>();
  await isar.writeTxn(() async {
    await groups.put(group);
  });
}

void addMemberToGroup(Isar isar, Groups group, User member) async {
  final groups = isar.collection<Groups>();
  var dataToChange = groups.filter().groupIdEqualTo(group.groupId);
}*/

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
    ..expenseAmount = '120'
    ..expenseTimestamp = DateTime.now()
    ..expenseLocation = 'Sau Paulo'
    ..expenseMembers = [userObj.userId!, userObj.userId!]
    ..expenseDistribution = null;

  final expenseObj1 = Expenses()
    ..expenseId = 'E0A00002'
    ..expenseName = 'Books'
    ..expenseAmount = '400'
    ..expenseTimestamp = DateTime.now()
    ..expenseLocation = 'Smriti Garden'
    ..expenseMembers = [userObj1.userId!]
    ..expenseDistribution = null;

  final expenseObj2 = Expenses()
    ..expenseId = 'E0A00003'
    ..expenseName = 'Parking'
    ..expenseAmount = '15'
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

  await isar.writeTxn(() async {});

  //final favorites = await groups.get(1);
}
