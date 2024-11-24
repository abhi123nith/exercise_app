import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../models/progress.dart';

class ProgressProvider with ChangeNotifier {
  final Box<Progress> _box = Hive.box<Progress>('progressBox');
  Map<int, bool> daysUnlocked = {1: true};
  void unlockNextDay(int day) {
    daysUnlocked[day + 1] = true;
    notifyListeners();
  }

  void saveProgress(Progress progress) async {
    await _box.put('day${progress.day}_exercise${progress.exercise}', progress);
    notifyListeners();
  }

  List<Progress> getProgressForDay(int day) {
    return _box.values
        .where((progress) => progress.day == day)
        .toList()
        .cast<Progress>();
  }
}
