import 'package:flutter/widgets.dart';

import '../model.dart';
import '../style.dart';
import 'gauge_band.dart';

class CircularGauge extends StatefulWidget {
  final Size size;
  final MultiGaugeModel model;
  final GaugeDataset dataset;
  final MultiGaugeStyle style;
  final GaugeDatasetStyle datasetStyle;

  const CircularGauge(
      {super.key,
      required this.size,
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
    final lower = (widget.dataset.lower ?? widget.model.lowerBound) -
        widget.model.lowerBound;
    final upper = widget.dataset.upper;
    if (upper != null) {
      final bandUpper = upper - widget.model.lowerBound;
      final extent = (widget.model.upperBound - widget.model.lowerBound);
      return GaugeBand(
        size: widget.size,
        color: widget.datasetStyle.color,
        lineSize: widget.datasetStyle.thickness,
        strokeCap: StrokeCap.round,
        start: lower,
        end: bandUpper,
        extent: extent,
      );
    }
    return Container();
  }
}
