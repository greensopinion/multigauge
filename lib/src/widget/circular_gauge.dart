import 'package:flutter/widgets.dart';
import 'package:multigauge/multigauge.dart';
import 'package:multigauge/src/widget/gauge_band.dart';
import '../model.dart';

class CircularGauge extends StatefulWidget {
  final MultiGaugeModel model;
  final GaugeDataset dataset;
  final MultiGaugeStyle style;
  final GaugeDatasetStyle datasetStyle;

  const CircularGauge(
      {super.key,
      required this.model,
      required this.dataset,
      required this.style,
      required this.datasetStyle});

  @override
  State<StatefulWidget> createState() => _CircularGaugeState();
}

class _CircularGaugeState extends State<CircularGauge> {
  @override
  void didUpdateWidget(CircularGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != widget.model ||
        oldWidget.dataset != widget.dataset ||
        oldWidget.style != widget.style) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Stack(children: [
              GaugeBand(
                size: constraints.biggest,
                color: widget.style.backgoundColor,
                lineSize: widget.datasetStyle.thickness,
                start: 0,
                end: 100,
                extent: 100,
              ),
            ]));
  }
}
