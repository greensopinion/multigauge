import 'package:flutter_test/flutter_test.dart';

import 'package:multigauge/multigauge.dart';

void main() {
  test('provdies a widget', () {
    expect(MultiGauge, MultiGauge);
  });
  test('provdies a model', () {
    expect(MultiGaugeModel, MultiGaugeModel);
    expect(GaugeDataset, GaugeDataset);
  });
  test('provdies a style', () {
    expect(MultiGaugeStyle, MultiGaugeStyle);
    expect(GaugeDatasetStyle, GaugeDatasetStyle);
  });
}
