import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/progress.dart';

class HiveInit {
  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(
        ProgressAdapter()); // Ensuring this is called only once
    if (kDebugMode) {
      print("Hive initialized and adapter registered.");
    }
  }
}
