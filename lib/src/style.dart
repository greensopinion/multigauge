import 'package:flutter/widgets.dart';
import '../multigauge.dart';

class MultiGaugeStyle {
  /// the background color of the gauge
  final Color backgoundColor;

  /// the line thickness of each dataset
  final double thickness;

  /// the dataset styles
  final List<GaugeDatasetStyle> datasetStyles;

  /// the duration of animations when rendering gauge
  final Duration? animationDuration;

  MultiGaugeStyle(
      {required this.backgoundColor,
      required this.thickness,
      this.animationDuration,
      required this.datasetStyles});
}

class GaugeDatasetStyle {
  final Color color;
  final Widget Function(BuildContext, GaugeDataset)? builder;

  GaugeDatasetStyle({required this.color, this.builder});
}
