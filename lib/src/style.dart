import 'package:flutter/widgets.dart';
import '../multigauge.dart';

class MultiGaugeStyle {
  final Color backgoundColor;
  late final StrokeCap backgroundCap;
  final List<GaugeDatasetStyle> datasetStyles;

  /// the duration of animations when rendering gauge
  final Duration? animationDuration;

  MultiGaugeStyle(
      {required this.backgoundColor,
      this.backgroundCap = StrokeCap.round,
      this.animationDuration,
      required this.datasetStyles});
}

class GaugeDatasetStyle {
  final double thickness;
  final Color color;
  final Widget Function(BuildContext, GaugeDataset)? builder;

  GaugeDatasetStyle(
      {required this.thickness, required this.color, this.builder});
}
