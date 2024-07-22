import 'dart:math';

import 'package:flutter/widgets.dart';
import 'widget/gauge_band.dart';
import 'style.dart';
import 'widget/circular_gauge.dart';
import 'model.dart';

class MultiGauge extends StatelessWidget {
  final MultiGaugeModel model;
  final MultiGaugeStyle style;

  const MultiGauge({super.key, required this.model, required this.style});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final backgroundChildren = <Widget>[];
          final children = <Widget>[];
          final innerChildren = <Widget>[];
          for (var x = 0; x < model.datasets.length; ++x) {}
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
                      color: style.backgoundColor,
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
                    color: style.backgoundColor,
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
