/// The model that provides data for a [MultiGauge].
class MultiGaugeModel {
  /// The lower bound of the data that the gauge can display.
  /// This may be different than the lower bound provided by the [datasets].
  final double lowerBound;

  /// The upper bound of the data that the gauge can display.
  /// This may be different than the upper bound provided by the [datasets].
  final double upperBound;

  /// The datasets of the gauge.
  final List<GaugeDataset> datasets;

  MultiGaugeModel(
      {required this.lowerBound,
      required this.upperBound,
      required this.datasets});
}

/// A dataset.
class GaugeDataset {
  /// The name of the dataset, which can be used for debugging purposes.
  final String name;

  /// The lower level of the dataset, which is the lowest value of the dataset
  /// band. May be null if the dataset is empty.
  final double? lower;

  /// The highest level of the dataset, which is the lowest value of the dataset
  /// band. May be null if the dataset is empty.
  final double? upper;

  GaugeDataset({required this.name, required this.lower, required this.upper});
}
