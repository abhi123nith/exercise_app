import 'package:flutter/material.dart';

class RoadmapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromARGB(255, 47, 40, 77)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    Paint nodePaint = Paint()
      ..color = const Color.fromARGB(255, 234, 231, 231)
      ..style = PaintingStyle.fill;

    Paint inner = Paint()
      ..color = const Color.fromARGB(255, 117, 109, 154)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Paint mid = Paint()
      ..color = const Color.fromARGB(255, 113, 104, 156)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();

    // Starting point at the center top of the screen
    double width = size.width;
    path.moveTo(width * 0.63, 50);

    // Add cubic curves for smooth transitions between nodes
    path.cubicTo(
      width * 0.1, 120, // Control point 1
      width * 0.24, 190, // Control point 2
      width * 0.21, 210, // End point
    );
    path.cubicTo(
      width * 0.21,
      220,
      width * 1.28,
      300,
      width * 0.5,
      355,
    );
    path.cubicTo(
      width * 0.2,
      390,
      width * 0.19,
      407,
      width * 0.38,
      445,
    );
    path.cubicTo(
      width * 0.34,
      446,
      width * 1.2,
      550,
      width * 0.3,
      660,
    );
    path.cubicTo(
      width * 0.3,
      660,
      width * 0.1,
      670,
      width * 0.4,
      780,
    );

    // Draw the path (curved lines)
    canvas.drawPath(path, paint);

    // Draw nodes (circles) at the key points on the path
    _drawNode(canvas, width * 0.63, 50, nodePaint, inner, mid); //1
    _drawNode(canvas, width * 0.36, 100, nodePaint, inner, mid); //2
    _drawNode(canvas, width * 0.227, 210, nodePaint, inner, mid); //3
    _drawNode(canvas, width * 0.68, 271, nodePaint, inner, mid); //4
    _drawNode(canvas, width * 0.257, 410, nodePaint, inner, mid); //5
    _drawNode(canvas, width * 0.71, 550, nodePaint, inner, mid); //6
  }

  // Helper function to draw nodes (circles) at specific points
  void _drawNode(
      Canvas canvas, double x, double y, Paint paint, Paint inner, Paint mid) {
    canvas.drawCircle(Offset(x, y), 18, inner);
    canvas.drawCircle(Offset(x, y), 8, mid);
    canvas.drawCircle(Offset(x, y), 4, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
