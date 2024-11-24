import 'package:hive/hive.dart';

part 'progress.g.dart';

@HiveType(typeId: 0)
class Progress extends HiveObject {
  @HiveField(0)
  final int day;

  @HiveField(1)
  final int exercise;

  @HiveField(2)
  final int correctAnswers;

  Progress({
    required this.day,
    required this.exercise,
    required this.correctAnswers,
  });
}
