import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int? selectedOption; 
  bool isAnswerChecked = false; 
  final int correctAnswer =
      1; 
  bool isImageScaled = false; 

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        isImageScaled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Grammar Practice",
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.flag_outlined, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: 0.3, // Example progress
              color: const Color.fromARGB(255, 85, 152, 87),
              borderRadius: BorderRadius.circular(12),
              minHeight: 15,
              backgroundColor: Colors.grey[800],
            ),
            const SizedBox(height: 16),

            // Question
            const Text(
              "Q1. Fill in the blanks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),

            // Sentence
            const Text(
              "She wore a ______ dress to the party",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 46),

            // Center Image with Animation
            Center(
              child: AnimatedScale(
                scale: isImageScaled ? 1.1 : 1.0,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: ClipOval(
                  child: Image.asset(
                    'assets/exercise.jpg', 
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 56),

            Expanded(
              child: Column(
                children: List.generate(4, (index) {
                  String optionText = ""; 

                  switch (index) {
                    case 0:
                      optionText = "Beautifully";
                      break;
                    case 1:
                      optionText = "Beautiful";
                      break;
                    case 2:
                      optionText = "Beauty";
                      break;
                    case 3:
                      optionText = "Graceful";
                      break;
                    default:
                      optionText = "Option"; 
                  }

                  Color containerColor;
                  if (isAnswerChecked) {
                    if (index == correctAnswer) {
                      containerColor = Colors.green; // Correct answer
                    } else if (index == selectedOption) {
                      containerColor = Colors.red; // Wrong answer
                    } else {
                      containerColor = Colors.transparent;
                    }
                  } else {
                    containerColor = (index == selectedOption)
                        ? Colors.blue
                        : Colors.transparent;
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: isAnswerChecked
                          ? null
                          : () {
                              setState(() {
                                selectedOption = index;
                              });
                            },
                      child: Container(
                        decoration: BoxDecoration(
                          color: containerColor, 
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.white70, width: 0.8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Option Letter (A, B, C, D)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                    color: Colors.grey[700],
                                    borderRadius: BorderRadius.circular(6)),
                                child: Text(
                                  String.fromCharCode(65 + index), // A, B, C, D
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Option Text
                              Expanded(
                                child: Text(
                                  optionText,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Bottom Button
            GestureDetector(
              onTap: () {
                setState(() {
                  isAnswerChecked = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: isAnswerChecked
                        ? (selectedOption == correctAnswer
                            ? Colors.green
                            : Colors.red) // Change color based on answer
                        : Colors.blue,
                    borderRadius: BorderRadius.circular(22)),
                child: Center(
                  child: Text(
                    isAnswerChecked
                        ? (selectedOption == correctAnswer
                            ? "Great Work!"
                            : "Oops! Wrong Answer")
                        : "Check Answer",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
