import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multigauge/multigauge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'multigauge Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const upperBound = 100.0;
  static const defaultSize = 100.0;
  static const defaultThickness = 8.0;
  final random = Random();
  var size = defaultSize;
  var thickness = defaultThickness;
  var models = [
    MultiGaugeModel(lowerBound: 0.0, upperBound: upperBound, datasets: [
      GaugeDataset(name: 'First', lower: 23, upper: 63),
      GaugeDataset(name: 'Second', lower: 15, upper: 53)
    ])
  ];
  MultiGaugeStyle? style;

  void _randomize() {
    setState(() {
      size = defaultSize / 2.0 + defaultSize * random.nextDouble();
      thickness =
          defaultThickness / 2.0 + defaultThickness * random.nextDouble();
      models = List.generate(8, (i) => _newModel());
    });
  }

  MultiGaugeModel _newModel() {
    var datasetCount = max(1, (3 * random.nextDouble()).ceil());
    return MultiGaugeModel(
        lowerBound: 0.0,
        upperBound: 100.0,
        datasets:
            List.generate(datasetCount, (i) => _createDataset(name: '$i')));
  }

  GaugeDataset _createDataset({required String name}) {
    var upper = random.nextDouble() * upperBound;
    var lower = random.nextDouble() * upperBound;
    if (upper < lower) {
      final v = upper;
      upper = lower;
      lower = v;
    }
    return GaugeDataset(name: 'First', lower: lower, upper: upper);
  }

  @override
  Widget build(BuildContext context) {
    var style = this.style;
    if (style == null) {
      style = MultiGaugeStyle(
          backgoundColor: Theme.of(context).highlightColor,
          animationDuration: const Duration(seconds: 1),
          thickness: thickness,
          datasetStyles: [
            GaugeDatasetStyle(
                color: Colors.orange.shade500,
                builder: (context, dataset) => Text(
                    '${dataset.lower?.round()}-${dataset.upper?.round()}')),
            GaugeDatasetStyle(color: Colors.blue.shade500),
            GaugeDatasetStyle(color: Colors.green.shade500)
          ]);
      this.style = style;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('multigauge Example'),
        ),
        body: Column(children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _randomize, child: const Text('Randomize'))
                ],
              )),
          Expanded(
              child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Wrap(
                children: models
                    .map((it) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox.square(
                            dimension: size,
                            child: MultiGauge(
                              model: it,
                              style: style!,
                            ))))
                    .toList(),
              )
            ]),
          )),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 20,
            children: [
              Text('Size: ${size.printable()}'),
              Text('Thickness: ${thickness.printable()}')
            ],
          )
        ]));
  }
}

extension _Printable on double {
  double printable() => (this * 10).round() / 10;
}
