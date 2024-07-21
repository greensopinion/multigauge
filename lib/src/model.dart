class MultiGaugeModel {
  final double lowerBound;
  final double upperBound;
  final List<GaugeDataset> datasets;

  MultiGaugeModel(
      {required this.lowerBound,
      required this.upperBound,
      required this.datasets});
}

class GaugeDataset {
  final String name;
  final double? lower;
  final double? upper;

  GaugeDataset({required this.name, required this.lower, required this.upper});
}
