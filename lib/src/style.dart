import 'package:flutter/widgets.dart';
import '../multigauge.dart';

class MultiGaugeStyle {
  final Color backgoundColor;
  late final StrokeCap backgroundCap;
  final List<GaugeDatasetStyle> datasetStyles;

  MultiGaugeStyle(
      {required this.backgoundColor,
      this.backgroundCap = StrokeCap.round,
      required this.datasetStyles});
}

class GaugeDatasetStyle {
  final double thickness;
  final Color color;
  final Widget Function(BuildContext, GaugeDataset)? builder;

  GaugeDatasetStyle(
      {required this.thickness, required this.color, this.builder});
}
