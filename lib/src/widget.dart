import 'dart:math';

import 'package:flutter/material.dart';
import 'widget/gauge_band.dart';
import 'style.dart';
import 'widget/circular_gauge.dart';
import 'widget/extensions.dart';
import 'model.dart';

/// A widget that renders a gauge with multiple datasets.
///
/// To avoid re-rendering on every build, the style and model
/// should be retained in a stateful widget.
///
/// Should be placed within a fixed size container, e.g.
/// ```
/// SizedBox.square(
///    dimension: 90.0,
///    child: MultiGauge(
///       ...
///    )
/// )
/// ```
///
/// A [MultiGauge] displays datasets as arcs on a circular band.
/// Multiple datasets are rendered as parallel arcs.
class MultiGauge extends StatelessWidget {
  /// The model that provides data for the gauge
  final MultiGaugeModel model;

  /// The style that controls visual aspects of the gauge
  final MultiGaugeStyle style;

  const MultiGauge({super.key, required this.model, required this.style});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final backgroundChildren = <Widget>[];
          final children = <Widget>[];
          final innerChildren = <Widget>[];
          final backgroundColor = style.backgoundColor
              .copyWithoutAlpha(Theme.of(context).canvasColor);
          for (var x = 0; x < model.datasets.length; ++x) {
            final dataset = model.datasets[x];
            final datasetStyle = style.datasetStyles[x];
            Widget child = CircularGauge(
                size: constraints.biggest,
                model: model,
                dataset: dataset,
                style: style,
                datasetStyle: datasetStyle);
            final builder = datasetStyle.builder;
            if (builder != null) {
              innerChildren.add(builder(context, dataset));
            }
            final insets =
                EdgeInsets.all((x * style.thickness) + (style.thickness / 2.0));
            if (x > 0) {
              backgroundChildren.add(
                Padding(
                    padding: EdgeInsets.all(x * style.thickness),
                    child: GaugeBand(
                      size: constraints.biggest,
                      color: backgroundColor,
                      lineSize: style.thickness,
                      strokeCap: StrokeCap.square,
                      start: 0,
                      end: 100,
                      extent: 100,
                    )),
              );
            }
            backgroundChildren.add(
              Padding(
                  padding: insets,
                  child: GaugeBand(
                    size: constraints.biggest,
                    color: backgroundColor,
                    lineSize: style.thickness,
                    strokeCap: StrokeCap.round,
                    start: 0,
                    end: 100,
                    extent: 100,
                  )),
            );

            children.add(Padding(padding: insets, child: child));
          }
          if (innerChildren.isNotEmpty) {
            children.add(Padding(
                padding: EdgeInsets.all(
                    style.thickness * max(1, model.datasets.length)),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: innerChildren))));
          }
          return Stack(
            children: backgroundChildren + children,
          );
        },
      );
}
