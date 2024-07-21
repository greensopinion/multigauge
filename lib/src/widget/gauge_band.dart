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

  const GaugeBand(
      {super.key,
      required this.size,
      required this.color,
      required this.lineSize,
      required this.strokeCap,
      required this.start,
      required this.end,
      required this.extent,
      this.builder});

  @override
  Widget build(BuildContext context) =>
      CustomPaint(size: size, painter: _GaugeBandPainter(this));
}

class _GaugeBandPainter extends CustomPainter {
  final GaugeBand band;

  _GaugeBandPainter(this.band);

  @override
  void paint(Canvas canvas, Size size) {
    const absoluteStart = pi * 3 / 4;
    const absoluteEnd = pi * 3 / 2;
    const absoluteExtent = absoluteEnd - absoluteStart;
    final startOffset = (band.start / band.extent) * absoluteExtent;
    final endOffset = (band.end / band.extent) * absoluteExtent;

    final paint = Paint()
      ..color = band.color
      ..isAntiAlias = true
      ..strokeCap = band.strokeCap
      ..strokeWidth = band.lineSize
      ..style = PaintingStyle.stroke;
    canvas.drawArc(Offset.zero & size, absoluteStart + startOffset,
        absoluteStart - startOffset + endOffset, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
