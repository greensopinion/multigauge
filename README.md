# multigauge

Provides a Flutter widget that can render a gauge with multiple datasets.

<img src="https://raw.githubusercontent.com/greensopinion/multigauge/main/multigauge.png">

## Features

1. Multiple datasets in a single gauge
2. Separates style from data

## Install

Run the following command:

```sh
$ flutter pub add multigauge
```

This will update your `pubspec.yaml` as follows:

```yaml
dependencies:
  multigauge: ^1.0.0
```

## Usage

```dart
import 'package:multigauge/multigauge.dart';

// define the model, which represents the data
final model = MultiGaugeModel(lowerBound: 0.0, upperBound: upperBound, datasets: [
    GaugeDataset(name: 'First', lower: 23, upper: 63),
    GaugeDataset(name: 'Second', lower: 15, upper: 53)
]);

// define a style, which defines how to render the data
final style = MultiGaugeStyle(
    backgoundColor: Theme.of(context).highlightColor,
    animationDuration: const Duration(seconds: 1),
    thickness: 9.0,
    datasetStyles: [
        GaugeDatasetStyle(
            color: Colors.orange.shade500,
            builder: (context, dataset) => Text('${dataset.lower?.round()}-${dataset.upper?.round()}')),
        GaugeDatasetStyle(color: Colors.blue.shade500)
    ]
);

// use it in your page
Padding(
    padding: const EdgeInsets.all(8),
    child: SizedBox.square(
        dimension: 90,
        child: MultiGauge(
            model: model,
            style: style,
        )
    )
)

```

See the [example](./example) for more detailed usage.

## License

Copyright 2024 David Green

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors
   may be used to endorse or promote products derived from this software without
   specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
