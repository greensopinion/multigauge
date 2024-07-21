import 'package:flutter/widgets.dart';

class MultiGaugeStyle {
  final Color backgoundColor;
  final List<GaugeDatasetStyle> datasetStyles;

  MultiGaugeStyle({required this.backgoundColor, required this.datasetStyles});
}

class GaugeDatasetStyle {
  final double thickness;
  final Color color;

  GaugeDatasetStyle({required this.thickness, required this.color});
}
