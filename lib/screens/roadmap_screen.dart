import 'package:exercise_app/widgets/custom_painter.dart';
import 'package:exercise_app/screens/questions_screen.dart';
import 'package:flutter/material.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 62.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hey Mahesh",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                CustomPaint(
                  painter: RoadmapPainter(),
                  child: const SizedBox.expand(),
                ),
                // Clickable nodes
                _clickableNode(
                  context,
                  title: "Adjectives",
                  offset: Offset(
                    MediaQuery.of(context).size.width * 0.63,
                    50,
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 65,
                  child: _nodeLabel("Adjectives", true, alignLeft: true),
                ),
                Positioned(
                  top: 90,
                  right: 110,
                  child: _nodeLabel("Adverbs", false, alignLeft: false),
                ),
                Positioned(
                  top: 185,
                  left: 100,
                  child: _nodeLabel("Conjunctions", false, alignLeft: false),
                ),
                Positioned(
                  top: 275,
                  left: 87,
                  child: _nodeLabel("Prefix & Suffix", false, alignLeft: true),
                ),
                Positioned(
                  top: 395,
                  right: 60,
                  child:
                      _nodeLabel("Sentence Structure", false, alignLeft: false),
                ),
                Positioned(
                  top: 538,
                  left: 160,
                  child: _nodeLabel("Verbs", false, alignLeft: true),
                ),
                _clickableNode(
                  context,
                  title: "Adverbs",
                  offset: Offset(
                    MediaQuery.of(context).size.width * 0.36,
                    100,
                  ),
                ),
                _clickableNode(
                  context,
                  title: "Conjunctions",
                  offset: Offset(
                    MediaQuery.of(context).size.width * 0.227,
                    210,
                  ),
                ),
                _clickableNode(
                  context,
                  title: "Prefix & Suffix",
                  offset: Offset(
                    MediaQuery.of(context).size.width * 0.68,
                    271,
                  ),
                ),
                _clickableNode(
                  context,
                  title: "Sentence Structure",
                  offset: Offset(
                    MediaQuery.of(context).size.width * 0.257,
                    410,
                  ),
                ),
                _clickableNode(
                  context,
                  title: "Verbs",
                  offset: Offset(
                    MediaQuery.of(context).size.width * 0.71,
                    550,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _nodeLabel(String title, bool isTrue, {bool alignLeft = true}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 4),
      decoration: BoxDecoration(
          color: isTrue ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _clickableNode(BuildContext context,
      {required String title, required Offset offset}) {
    return Positioned(
      top: offset.dy - 18, // Adjust for node size
      left: offset.dx - 18,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: const Color.fromARGB(255, 20, 16, 39),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(26.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Center(
                      child: Text(
                        "Choose Exercise",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                                  color: Colors.deepPurpleAccent, // Border color
                                  width: 1.0,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'assets/exercise.jpg',
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //  const SizedBox(width: 20),
                                const Text(
                                  "Compound Adjectives",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  "2/3",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(height: 30),
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                                  color: Colors.deepPurpleAccent, // Border color
                                  width: 1.0,
                                )),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'assets/exercise.jpg',
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  "Participle Adjectives",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                        const SizedBox(height: 30),
                        Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                                  color: Colors.deepPurpleAccent, // Border color
                                  width: 1.0,
                                )),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    'assets/exercise.jpg',
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                const Text(
                                  "Order of Adjectives",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const QuestionScreen()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(17)),
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            "Start Practice",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          width: 36, // Diameter of the node
          height: 36,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

