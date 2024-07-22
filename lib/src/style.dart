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

  MultiGaugeStyle copyWithoutAlpha(Color background) {
    return MultiGaugeStyle(
        backgoundColor: backgoundColor.copyWithoutAlpha(background),
        thickness: thickness,
        datasetStyles: datasetStyles
            .map((it) => it._copyWithoutAlpha(background))
            .toList());
  }
}

class GaugeDatasetStyle {
  final Color color;
  final Widget Function(BuildContext, GaugeDataset)? builder;

  GaugeDatasetStyle({required this.color, this.builder});
  GaugeDatasetStyle _copyWithoutAlpha(Color background) => GaugeDatasetStyle(
      color: color.copyWithoutAlpha(background), builder: builder);
}

extension _ColorExtension on Color {
  Color copyWithoutAlpha(Color background) {
    if (alpha == 255) {
      return this;
    }
    double alphaMutliplier = alpha / 255.0;
    final red =
        this.red * alphaMutliplier + background.red * (1 - alphaMutliplier);
    final green =
        this.green * alphaMutliplier + background.green * (1 - alphaMutliplier);
    final blue =
        this.blue * alphaMutliplier + background.blue * (1 - alphaMutliplier);
    return Color.fromARGB(255, red.round(), green.round(), blue.round());
  }
}
