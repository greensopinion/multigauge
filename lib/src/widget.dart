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
          final totalThickness = style.datasetStyles
              .take(model.datasets.length)
              .map((it) => it.thickness)
              .reduce((a, b) => a + b);
          final children = <Widget>[
            Padding(
                padding: EdgeInsets.all(totalThickness / 2.0),
                child: GaugeBand(
                  size: constraints.biggest,
                  color: style.backgoundColor,
                  lineSize: totalThickness,
                  strokeCap: style.backgroundCap,
                  start: 0,
                  end: 100,
                  extent: 100,
                )),
          ];
          final innerChildren = <Widget>[];
          var padding = 0.0;
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
            children.add(Padding(
                padding:
                    EdgeInsets.all(padding + (datasetStyle.thickness / 2.0)),
                child: child));
            padding += datasetStyle.thickness;
          }
          if (innerChildren.isNotEmpty) {
            children.add(Padding(
                padding: EdgeInsets.all(padding),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: innerChildren))));
          }
          return Stack(
            children: children,
          );
        },
      );
}
