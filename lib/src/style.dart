import 'package:flutter/widgets.dart';
import '../multigauge.dart';

/// The visual style of a [MultiGauge]. Must have at least as many [datasetStyles]
/// as the model has datasets.
class MultiGaugeStyle {
  /// The background color of the gauge.
  final Color backgoundColor;

  /// The line thickness of each dataset.
  final double thickness;

  /// The dataset styles.
  final List<GaugeDatasetStyle> datasetStyles;

  /// The duration of animations when rendering gauge. Set to [Duration.zero] to have
  /// no animation.
  final Duration? animationDuration;

  MultiGaugeStyle(
      {required this.backgoundColor,
      required this.thickness,
      this.animationDuration,
      required this.datasetStyles});
}

/// The style of a dataset.
class GaugeDatasetStyle {
  /// The color of the dataset.
  final Color color;

  /// The builder for rendering the label of a dataset.
  final Widget Function(BuildContext, GaugeDataset)? builder;

  GaugeDatasetStyle({required this.color, this.builder});
}
