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

class _CircularGaugeState extends State<CircularGauge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: widget.style.animationDuration ?? const Duration(seconds: 0),
        vsync: this);
    final curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutSine);
    _animation = Tween<double>(begin: 0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CircularGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    final dataChanged = oldWidget.dataset != widget.dataset;
    if (oldWidget.model != widget.model ||
        dataChanged ||
        oldWidget.style != widget.style) {
      setState(() {
        if (dataChanged) {
          _controller.reset();
          _controller.forward();
        }
      });
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
      final size = (bandUpper - lower);
      return GaugeBand(
        key: Key(
            '${widget.key}_CircularGaugeState${widget.style.hashCode}_${_animation.value}'),
        size: widget.size,
        color: widget.datasetStyle.color,
        lineSize: widget.datasetStyle.thickness,
        strokeCap: StrokeCap.round,
        start: lower,
        end: lower + (size * _animation.value),
        extent: extent,
        willChange: !_animation.isCompleted,
      );
    }
    return Container();
  }
}
