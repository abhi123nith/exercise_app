import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ExerciseDatabase {
  static Database? _database;

  // Singleton pattern to avoid creating multiple instances of the database
  static Future<Database> get database async {
    if (_database != null) return _database!;

    // If the database is not initialized, initialize it
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'exercises.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE exercises(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          day INTEGER,
          subtitle TEXT, 
          question TEXT,
          option_a TEXT,
          option_b TEXT,
          option_c TEXT,
          option_d TEXT,
          correct_answer_index INTEGER,
          image TEXT
        );
        CREATE TABLE exercise_metadata(
          day INTEGER PRIMARY KEY,
          correct_answer_count INTEGER,
          total_questions_count INTEGER
        );
      ''');
    });
  }

  // Insert exercise data into the database
  static Future<void> insertExercise(Map<String, dynamic> exerciseData) async {
    final db = await database;
    await db.insert('exercises', exerciseData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Insert exercise metadata (correct answers count and total questions count)
  static Future<void> insertExerciseMetadata(
      int day, int correctAnswerCount, int totalQuestionsCount) async {
    final db = await database;
    await db.insert(
        'exercise_metadata',
        {
          'day': day,
          'correct_answer_count': correctAnswerCount,
          'total_questions_count': totalQuestionsCount
        },
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Fetch exercises for a specific day
  static Future<List<Map<String, dynamic>>> getExercises(int day) async {
    final db = await database;
    return await db.query('exercises', where: 'day = ?', whereArgs: [day]);
  }

  // Fetch metadata for a specific day
  static Future<Map<String, dynamic>?> getExerciseMetadata(int day) async {
    final db = await database;
    final result =
        await db.query('exercise_metadata', where: 'day = ?', whereArgs: [day]);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  static Future<void> insertAllExercises() async {
    final exercises = [
      // Day 1 - Adjectives
      {
        'day': 1,
        'subtitle': 'Compound Adjectives',
        'question':
            'The company implemented a ________ security protocol for their data centers.',
        'option_a': 'cutting-edge',
        'option_b': 'cutting edge',
        'option_c': 'edge-cutting',
        'option_d': 'edge cutting',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 1,
        'subtitle': 'Compound Adjectives',
        'question':
            'The physicist presented a ________ theory about quantum entanglement.',
        'option_a': 'ground breaking',
        'option_b': 'ground-breaking',
        'option_c': 'breaking-ground',
        'option_d': 'break-grounding',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },
      {
        'day': 1,
        'subtitle': 'Compound Adjectives',
        'question':
            'The expedition required _________ equipment for the harsh Antarctic conditions.',
        'option_a': 'military grade',
        'option_b': 'military-grade',
        'option_c': 'grade-military',
        'option_d': 'grade military',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },
      {
        'day': 1,
        'subtitle': 'Participle Adjectives',
        'question':
            'The _________ evidence presented at the trial changed the jury\'s perspective.',
        'option_a': 'overwhelming',
        'option_b': 'overwhelmed',
        'option_c': 'overwhelm',
        'option_d': 'overwhelms',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 1,
        'subtitle': 'Participle Adjectives',
        'question':
            'The archaeologists discovered a __________ manuscript in the ancient temple.',
        'option_a': 'fascinated',
        'option_b': 'fascinating',
        'option_c': 'fascinate',
        'option_d': 'fascinates',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },
      {
        'day': 1,
        'subtitle': 'Order of Adjectives',
        'question': 'She purchased a __________ briefcase for her new job.',
        'option_a': 'leather expensive Italian',
        'option_b': 'Italian expensive leather',
        'option_c': 'expensive Italian leather',
        'option_d': 'expensive leather Italian',
        'correct_answer_index': 2,
        'image': 'assets/exercise'
      },
      {
        'day': 1,
        'subtitle': 'Order of Adjectives',
        'question':
            'The museum displayed a __________ artifact from the Ming Dynasty.',
        'option_a': 'porcelain ancient valuable',
        'option_b': 'valuable ancient porcelain',
        'option_c': 'ancient valuable porcelain',
        'option_d': 'porcelain valuable ancient',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },

      // Day 2 - Adverbs
      {
        'day': 2,
        'subtitle': 'Adverbs of Manner in Complex Sentences',
        'question':
            'The soprano __________ executed the challenging aria, earning a standing ovation.',
        'option_a': 'flawless',
        'option_b': 'flawlessly',
        'option_c': 'flawlessness',
        'option_d': 'flawlessing',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },
      {
        'day': 2,
        'subtitle': 'Adverbs of Manner in Complex Sentences',
        'question':
            'The quantum computer _______ processed the complex algorithms, surpassing traditional computing methods.',
        'option_a': 'efficient',
        'option_b': 'efficiency',
        'option_c': 'efficiently',
        'option_d': 'efficienting',
        'correct_answer_index': 2,
        'image': 'assets/exercise'
      },
      {
        'day': 2,
        'subtitle': 'Comparative and Superlative Adverbs',
        'question':
            'Among all the competitors, Sarah completed the triathlon _______ than expected.',
        'option_a': 'more impressively',
        'option_b': 'more impressive',
        'option_c': 'most impressively',
        'option_d': 'impressive',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 2,
        'subtitle': 'Comparative and Superlative Adverbs',
        'question':
            'The financial analysis was presented ________ of all the quarterly reports.',
        'option_a': 'more comprehensively',
        'option_b': 'most comprehensively',
        'option_c': 'more comprehensive',
        'option_d': 'comprehensive',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },
      {
        'day': 2,
        'subtitle': 'Comparative and Superlative Adverbs',
        'question':
            'The AI system performed ________ in the latest benchmarking tests.',
        'option_a': 'more sophisticated',
        'option_b': 'sophisticatedly',
        'option_c': 'most sophisticatedly',
        'option_d': 'sophisticated',
        'correct_answer_index': 2,
        'image': 'assets/exercise'
      },

      // Day 3 - Conjunctions
      {
        'day': 3,
        'subtitle': 'Correlative Conjunctions',
        'question':
            '_______ did the research paper receive acclaim for its methodology, _ it was praised for its innovative conclusions.',
        'option_a': 'Not only / but also',
        'option_b': 'Either / or',
        'option_c': 'Neither / nor',
        'option_d': 'Both / and',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 3,
        'subtitle': 'Correlative Conjunctions',
        'question':
            '______ the quantum theory _______ the string theory could fully explain the observed phenomena.',
        'option_a': 'Both / and',
        'option_b': 'Either / or',
        'option_c': 'Neither / nor',
        'option_d': 'Not only / but also',
        'correct_answer_index': 2,
        'image': 'assets/exercise'
      },
      {
        'day': 3,
        'subtitle': 'Subordinating Conjunctions in Academic Context',
        'question':
            'The experiment yielded unexpected results ________ the researchers followed the protocol precisely.',
        'option_a': 'although',
        'option_b': 'because',
        'option_c': 'unless',
        'option_d': 'if',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 3,
        'subtitle': 'Subordinating Conjunctions in Academic Context',
        'question':
            'The archaeological team will continue excavating _______ they find evidence of the ancient civilization.',
        'option_a': 'unless',
        'option_b': 'until',
        'option_c': 'while',
        'option_d': 'whereas',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },

      // Day 4 - Prefix Suffix
      {
        'day': 4,
        'subtitle': 'Scientific and Academic Prefixes',
        'question':
            'The researcher\'s _______ analysis of the data revealed several anomalies.',
        'option_a': 'meta',
        'option_b': 'pseudo',
        'option_c': 'anti',
        'option_d': 'poly',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 4,
        'subtitle': 'Scientific and Academic Prefixes',
        'question':
            'The team developed a _______ solution that addressed multiple problems simultaneously.',
        'option_a': 'mono',
        'option_b': 'uni',
        'option_c': 'multi',
        'option_d': 'bi',
        'correct_answer_index': 2,
        'image': 'assets/exercise'
      },
      {
        'day': 4,
        'subtitle': 'Advanced Suffixes in Technical Context',
        'question':
            'The ______ of quantum mechanics requires extensive mathematical knowledge.',
        'option_a': 'complexity',
        'option_b': 'complexify',
        'option_c': 'complexification',
        'option_d': 'complexize',
        'correct_answer_index': 2,
        'image': 'assets/exercise'
      },
      {
        'day': 4,
        'subtitle': 'Advanced Suffixes in Technical Context',
        'question':
            'The artificial intelligence showed remarkable ________ in problem-solving tasks.',
        'option_a': 'adaptable',
        'option_b': 'adaptability',
        'option_c': 'adaptation',
        'option_d': 'adaptive',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },

      // Day 5 - Sentence Structure
      {
        'day': 5,
        'subtitle': 'Inverted Sentence Structures',
        'question':
            '_______ the revolutionary technology that the potential for clean energy became apparent.',
        'option_a': 'Not until the scientists developed',
        'option_b': 'Until the scientists developed',
        'option_c': 'The scientists developed until',
        'option_d': 'Developed the scientists until',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 5,
        'subtitle': 'Inverted Sentence Structures',
        'question':
            '_______ the complex theories of quantum physics lies a simple mathematical principle.',
        'option_a': 'Beneath',
        'option_b': 'Under',
        'option_c': 'Below',
        'option_d': 'Underneath of',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 5,
        'subtitle': 'Parallel Structure in Complex Sentences',
        'question':
            'The research involved _______ data, analyzing statistical patterns, and presenting conclusions.',
        'option_a': 'to collect',
        'option_b': 'collecting',
        'option_c': 'collection of',
        'option_d': 'collected',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },
      {
        'day': 5,
        'subtitle': 'Parallel Structure in Complex Sentences',
        'question':
            'The CEO\'s strategy was ______, innovative, and transformative.',
        'option_a': 'being bold',
        'option_b': 'to be bold',
        'option_c': 'bold',
        'option_d': 'boldly',
        'correct_answer_index': 2,
        'image': 'assets/exercise'
      },

      // Day 6 - Verbs
      {
        'day': 6,
        'subtitle': 'Perfect Progressive Tenses',
        'question':
            'By next year, the scientists _______ on this project for a decade.',
        'option_a': 'will have been working',
        'option_b': 'will be working',
        'option_c': 'would have been working',
        'option_d': 'would be working',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 6,
        'subtitle': 'Perfect Progressive Tenses',
        'question':
            'The AI system _______ increasingly complex patterns before the anomaly was detected.',
        'option_a': 'had been recognizing',
        'option_b': 'has been recognizing',
        'option_c': 'was recognizing',
        'option_d': 'is recognizing',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 6,
        'subtitle': 'Modal Perfect Verbs',
        'question':
            'The experiment ______ different results if the temperature had been controlled more precisely.',
        'option_a': 'might yield',
        'option_b': 'might have yielded',
        'option_c': 'must yield',
        'option_d': 'must have yielded',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },
      {
        'day': 6,
        'subtitle': 'Modal Perfect Verbs',
        'question':
            'The research team ________ the deadline, but the equipment malfunction caused delays.',
        'option_a': 'could meet',
        'option_b': 'could have met',
        'option_c': 'should meet',
        'option_d': 'should have met',
        'correct_answer_index': 1,
        'image': 'assets/exercise'
      },
      {
        'day': 6,
        'subtitle': 'Subjunctive Mood',
        'question':
            'The ethics committee recommended that the study _______ immediately.',
        'option_a': 'be terminated',
        'option_b': 'is terminated',
        'option_c': 'was terminated',
        'option_d': 'were terminated',
        'correct_answer_index': 0,
        'image': 'assets/exercise'
      },
      {
        'day': 6,
        'subtitle': 'Subjunctive Mood',
        'question':
            'The professor suggested that each student _______ their own research methodology.',
        'option_a': 'develops',
        'option_b': 'developed',
        'option_c': 'develop',
        'option_d': 'has developed',
        'correct_answer_index': 2,
        'image': 'assets/exercise'
      }
    ];

    final db = await database;

    for (var exercise in exercises) {
      await db.insert(
        'exercises',
        {
          'day': exercise['day'],
          'subtitle': exercise['subtitle'],
          'question': exercise['question'],
          'option_a': exercise['option_a'],
          'option_b': exercise['option_b'],
          'option_c': exercise['option_c'],
          'option_d': exercise['option_d'],
          'correct_answer_index': exercise['correct_answer_index']
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
