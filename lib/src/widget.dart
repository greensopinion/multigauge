import 'package:flutter/widgets.dart';
import './style.dart';
import './widget/circular_gauge.dart';
import './model.dart';

class MultiGauge extends StatelessWidget {
  final MultiGaugeModel model;
  final MultiGaugeStyle style;

  const MultiGauge({super.key, required this.model, required this.style});

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (var x = 0; x < model.datasets.length; ++x) {
      children.add(CircularGauge(
          model: model,
          dataset: model.datasets[x],
          style: style,
          datasetStyle: style.datasetStyles[x]));
    }
    return Stack(
      children: children,
    );
  }
}
