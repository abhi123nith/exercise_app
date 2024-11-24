import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RoadmapScreen(),
  ));
}

class RoadmapScreen extends StatelessWidget {
  final List<String> roadmapLabels = [
    'Adjectives',
    'Adverbs',
    'Conjunctions',
    'Prefix & Suffix',
    'Sentence structure',
    'Verbs',
  ];
  final int currentStep = 2;

   RoadmapScreen({super.key}); // The current active step (0-based index)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Hey Mahesh',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: CustomPaint(
          painter: RoadmapPainter(
            roadmapLabels.length,
            currentStep,
          ),
          child: SizedBox(
            height: roadmapLabels.length * 200.0,
            child: Stack(
              children: List.generate(roadmapLabels.length, (index) {
                return Positioned(
                  left: index.isEven ? 50.0 : MediaQuery.of(context).size.width - 150.0,
                  top: index * 200.0 + 80,
                  child: _buildNode(
                    roadmapLabels[index],
                    index == currentStep,
                    index < currentStep,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNode(String label, bool isActive, bool isCompleted) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Colors.green
                : isCompleted
                    ? Colors.blue
                    : Colors.grey[800],
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.6),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.all(12.0),
          child: const Icon(
            Icons.circle,
            color: Colors.white,
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class RoadmapPainter extends CustomPainter {
  final int nodeCount;
  final int currentStep;

  RoadmapPainter(this.nodeCount, this.currentStep);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.grey[800]!
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final Paint activeLinePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < nodeCount - 1; i++) {
      // Start and end points for the curve
      final start = Offset(
        i.isEven ? 100.0 : size.width - 100.0,
        i * 200.0 + 100,
      );
      final end = Offset(
        (i + 1).isEven ? 100.0 : size.width - 100.0,
        (i + 1) * 200.0 + 100,
      );

      // Control point for the curve (adjust for smoother lines)
      final controlPoint = Offset(
        size.width / 2, // Middle of the screen horizontally
        (start.dy + end.dy) / 2, // Midpoint vertically between start and end
      );

      final path = Path()
        ..moveTo(start.dx, start.dy)
        ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, end.dx, end.dy);

      // Draw completed or active paths with the appropriate paint
      if (i < currentStep) {
        canvas.drawPath(path, activeLinePaint);
      } else {
        canvas.drawPath(path, linePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
