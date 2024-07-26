import 'package:flutter_test/flutter_test.dart';

import 'package:multigauge/multigauge.dart';

void main() {
  test('provides a widget', () {
    expect(MultiGauge, MultiGauge);
  });
  test('provides a model', () {
    expect(MultiGaugeModel, MultiGaugeModel);
    expect(GaugeDataset, GaugeDataset);
  });
  test('provides a style', () {
    expect(MultiGaugeStyle, MultiGaugeStyle);
    expect(GaugeDatasetStyle, GaugeDatasetStyle);
  });
}
