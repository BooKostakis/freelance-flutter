
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ididid/variables/global_varibles.dart';

part 'create_user_data.g.dart';

Future<void> createUserData() async {
  await Hive.initFlutter();

  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(RitualModelAdapter());
  Hive.registerAdapter(DailyTaskAdapter());
  Hive.registerAdapter(GoalAdapter());
  Hive.registerAdapter(HabitAdapter());
  Hive.registerAdapter(TimeAdapter());
  Hive.registerAdapter(TaskHistoryAdapter());
  

  var box = await Hive.openBox<RitualModel>('RitualModel');

  if (box.length > 0) {
    allRitualModels = box.values.toList();
  }
  // print(allRitualModels.length);


  var boxSettings = await Hive.openBox<Settings>('Settings');

  if (boxSettings.length < 1) {
    settings = Settings(
    onboardingShown:false,
    hintsAmount: 3,
    
        );
    boxSettings.add(settings);
  } else {
    settings = boxSettings.values.toList()[0];
  }
}

// // Future<Settings> getSettings() async {
// //   var box = await Hive.openBox<Settings>('Settings');
// //   Settings settings = box.values.toList()[0];
// //   return settings;
// // }

// addNewCurrencyName(String newName) async {
//   Random random = Random();

// int randomColor = 0xff000000 + random.nextInt(0xffffff);

//   var box = await Hive.openBox<Settings>('Settings');
//   Settings newSettings = Settings(
//     allPrices: settings.allPrices,
//     date: settings.date,
//     allCurrencyNames: [...settings.allCurrencyNames, newName],
//     allCurrencyColors: [...settings.allCurrencyColors, randomColor]);
//     settings = newSettings;
//     box.putAt(0, newSettings);
// }

saveSettings({required Settings newSettings}) async {
  var box = await Hive.openBox<Settings>('Settings');
  settings = newSettings;
  box.putAt(0, newSettings);
}

@HiveType(typeId: 14)
class Settings {
  Settings({
    required this.onboardingShown,
    required this.hintsAmount,
    
    
  });

  @HiveField(0)
  bool onboardingShown;
  @HiveField(1)
  int hintsAmount;
  


  

  Settings copyWith({
    bool? onboardingShown,
    int? hintsAmount,
  }) {
    return Settings(
      onboardingShown: onboardingShown ?? this.onboardingShown,
      hintsAmount: hintsAmount ?? this.hintsAmount,
     
      
    );
  }
}


@HiveType(typeId: 12)
class RitualModel {
  RitualModel({
    required this.title,
    required this.description,
    required this.icon,
    required this.pressedTimes,
  });

  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String icon;
  @HiveField(10)
  List<DateTime> pressedTimes;


}

Future<void> addNewRitual({
  title = String,
    description = String,
    icon = String,
    pressedTimes = List<DateTime>,
}) async {

  var box = await Hive.openBox<RitualModel>('RitualModel');

  RitualModel newRitualModel = RitualModel(
    title: title,
    description: description,
    icon: icon,
    pressedTimes: pressedTimes,
  );
  box.add(newRitualModel);
  allRitualModels = box.values.toList();
}


Future<void> saveEditiingRitual({
  title = String,
    description = String,
    icon = String,
    pressedTimes = DateTime,
    ritualIndex = int,
}) async {

  var box = await Hive.openBox<RitualModel>('RitualModel');

  RitualModel newRitualModel = RitualModel(
    title: title,
    description: description,
    icon: icon,
    pressedTimes: pressedTimes,
  );

  //  RitualModel curentRitual = allRitualModels.firstWhere((element) => element.title == title);
  int curentIndex = ritualIndex;//allRitualModels.indexOf(curentRitual);

  box.putAt(curentIndex, newRitualModel);
  allRitualModels = box.values.toList();
}



Future<void> deleteRitual({
  title = String,
}) async {

  var box = await Hive.openBox<RitualModel>('RitualModel');

  RitualModel newCardToDelete = allRitualModels.firstWhere((element) => element.title == title);
  int indexToDelete = allRitualModels.indexOf(newCardToDelete);
  await box.deleteAt(indexToDelete);
  allRitualModels = box.values.toList();
}

Future<void> minusPressedTimes({
  ritual = RitualModel,
}) async {

  var box = await Hive.openBox<RitualModel>('RitualModel');

  RitualModel currentRitual = allRitualModels.firstWhere((element) => element.title == ritual.title);

  List<DateTime> pressedTimes = currentRitual.pressedTimes;
  int index = allRitualModels.indexOf(currentRitual);
  if(pressedTimes.isNotEmpty) {
    pressedTimes.removeLast();
  }
  currentRitual.pressedTimes = pressedTimes;

  await box.putAt(index, currentRitual);
  allRitualModels = box.values.toList();
}

Future<void> plusPressedTimes({
  ritual = RitualModel,
}) async {

  var box = await Hive.openBox<RitualModel>('RitualModel');

  RitualModel currentRitual = allRitualModels.firstWhere((element) => element.title == ritual.title);

  List<DateTime> pressedTimes = currentRitual.pressedTimes;
  int index = allRitualModels.indexOf(currentRitual);
  pressedTimes.add(DateTime.now());
  currentRitual.pressedTimes = pressedTimes;

  await box.putAt(index, currentRitual);
  allRitualModels = box.values.toList();
}

Future<void> refreshPressedTimes({
  ritual = RitualModel,
}) async {

  var box = await Hive.openBox<RitualModel>('RitualModel');

  RitualModel currentRitual = allRitualModels.firstWhere((element) => element.title == ritual.title);

  int index = allRitualModels.indexOf(currentRitual);
  currentRitual.pressedTimes = [];

  await box.putAt(index, currentRitual);
  allRitualModels = box.values.toList();
}

@HiveType(typeId: 15)
class DailyTask {
  DailyTask({
    required this.title,
    required this.note,
    required this.price,
    required this.index,
    required this.date,
    required this.isFinished,
  });

  @HiveField(0)
  String title;
  @HiveField(1)
  String note;
  @HiveField(2)
  int price;
  @HiveField(3)
  int index;
  @HiveField(4)
  DateTime date;
  @HiveField(5)
  bool isFinished;


}


@HiveType(typeId: 16)
class Goal {
  Goal({
    required this.title,
    required this.note,
  });

  @HiveField(0)
  String title;
  @HiveField(1)
  String note;


}


@HiveType(typeId: 17)
class Habit {
  Habit({
    required this.title,
    required this.note,
    required this.startDate,
    required this.finishDate,
  });

  @HiveField(0)
  String title;
  @HiveField(1)
  String note;
  @HiveField(2)
  DateTime? startDate;
  @HiveField(3)
  DateTime? finishDate;

}


@HiveType(typeId: 18)
class Time {
  Time({
    required this.h,
    required this.m,
  });

  @HiveField(0)
  int h;
  @HiveField(1)
  int m;

}

@HiveType(typeId: 19)
class TaskHistory {
  TaskHistory({
    required this.title,
    required this.amount,
    required this.date,
  });

  @HiveField(0)
  String title;
  @HiveField(1)
  int amount;
  @HiveField(2)
  DateTime date;


}