import 'package:flutter/widgets.dart';

extension ColorExtension on Color {
  Color copyWithoutAlpha(Color background) {
    if (alpha == 255) {
      return this;
    }
    double alphaMutliplier = alpha / 255.0;
    final red =
        this.red * alphaMutliplier + background.red * (1 - alphaMutliplier);
    final green =
        this.green * alphaMutliplier + background.green * (1 - alphaMutliplier);
    final blue =
        this.blue * alphaMutliplier + background.blue * (1 - alphaMutliplier);
    return Color.fromARGB(255, red.round(), green.round(), blue.round());
  }
}
