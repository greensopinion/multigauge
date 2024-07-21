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
  @override
  Widget build(BuildContext context) {
    final model = MultiGaugeModel(
        lowerBound: 0.0,
        upperBound: 100.0,
        datasets: [GaugeDataset(name: 'First', lower: 23, upper: 73)]);
    final style = MultiGaugeStyle(
        backgoundColor: Theme.of(context).highlightColor,
        datasetStyles: [
          GaugeDatasetStyle(thickness: 10.0, color: Colors.orange.shade300)
        ]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('multigauge Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox.square(
                dimension: 50,
                child: MultiGauge(
                  model: model,
                  style: style,
                ))
          ],
        ),
      ),
    );
  }
}
