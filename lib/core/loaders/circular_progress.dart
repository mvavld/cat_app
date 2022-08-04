import 'dart:math' as math;

import 'package:cat_app/resources/app_colors.dart';
import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  CircularProgress({
    this.size = 56,
    this.secondaryColor = AppColors.background,
    this.primaryColor,
    this.lapDuration = 1000,
    this.strokeWidth = 7,
  });

  final double size;
  final Color secondaryColor;
  Color? primaryColor = AppColors.accent;
  final int lapDuration;
  final double strokeWidth;

  @override
  _CircularProgress createState() => _CircularProgress();
}

class _CircularProgress extends State<CircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.lapDuration))
      ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(controller),
      child: CustomPaint(
        painter: CirclePaint(
            progress: controller.value,
            secondaryColor: widget.secondaryColor,
            primaryColor: widget.primaryColor ?? AppColors.accent,
            strokeWidth: widget.strokeWidth),
        size: Size(widget.size, widget.size),
      ),
    );
  }
}

class CirclePaint extends CustomPainter {
  CirclePaint({
    this.progress = 1,
    this.secondaryColor = Colors.grey,
    this.primaryColor = Colors.blue,
    this.strokeWidth = 15,
  });
  final Color secondaryColor;
  final Color primaryColor;
  final double strokeWidth;
  final double progress;

  double _degreeToRad(double degree) => degree * math.pi / 180;

  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = size.height / 2;

    final paint = Paint()
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: [secondaryColor, primaryColor],
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(
        Rect.fromCircle(center: Offset(centerPoint, centerPoint), radius: 0));

    final scapSize = strokeWidth * 0.70;
    final scapToDegree = scapSize / centerPoint;
// 2
    final startAngle = _degreeToRad(270) + scapToDegree;
    final sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(Offset(0, 0) & Size(size.width, size.width), startAngle,
        sweepAngle, false, paint..color = primaryColor);
  }

  @override
  bool shouldRepaint(CirclePaint oldDelegate) {
    return true;
  }
}
