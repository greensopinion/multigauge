import 'dart:math';

import 'package:flutter/widgets.dart';

class GaugeBand extends StatelessWidget {
  final Size size;
  final Color color;
  final double lineSize;
  final StrokeCap strokeCap;
  final double start;
  final double end;
  final double extent;
  final WidgetBuilder? builder;
  final bool willChange;

  const GaugeBand(
      {super.key,
      required this.size,
      required this.color,
      required this.lineSize,
      required this.strokeCap,
      required this.start,
      required this.end,
      required this.extent,
      this.willChange = false,
      this.builder});

  @override
  Widget build(BuildContext context) => CustomPaint(
      size: size, painter: _GaugeBandPainter(this), willChange: willChange);
}

class _GaugeBandPainter extends CustomPainter {
  final GaugeBand band;

  _GaugeBandPainter(this.band);

  @override
  void paint(Canvas canvas, Size size) {
    final startOffset = (band.start / band.extent) * fullSweep;
    final endOffset = (band.end / band.extent) * fullSweep;
    final paint = Paint()
      ..color = band.color
      ..isAntiAlias = true
      ..strokeCap = band.strokeCap
      ..strokeWidth = band.lineSize
      ..style = PaintingStyle.stroke;
    canvas.drawArc(Offset.zero & size, absoluteStart + startOffset,
        max(endOffset - startOffset, minimumSweep), false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

const fullSweep = pi * 3 / 2;
const absoluteStart = pi * 3 / 4;
const minimumSweep = fullSweep / 1000;
