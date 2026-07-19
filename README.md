# sfere

A declarative Flutter system for aggregating and observing values contributed
from multiple points in the widget tree.

A `Sfere` establishes a scope. `SferePoint`s placed anywhere beneath it each
contribute a value into that scope; the scope aggregates them into a collection,
and builders/selectors rebuild as the collection changes.

> **Early release.** The API is usable but still lightly documented — see the
> API docs, with fuller documentation and examples coming in a later release.

## Getting started

```yaml
dependencies:
  sfere: ^0.1.0
```

```dart
import 'package:sfere/sfere.dart';
```

## Usage

```dart
// A scope that observes the aggregated values contributed beneath it.
CustomSfere<int>(
  child: Column(
    children: [
      // Rebuilds whenever the set of contributed values changes.
      CustomSfereBuilder<int>(
        builder: (context, values) => Text('contributed: ${values.length}'),
      ),
      // Each point contributes a value into the enclosing scope.
      SferePoint<int>(value: 1, child: const SizedBox.shrink()),
      SferePoint<int>(value: 2, child: const SizedBox.shrink()),
    ],
  ),
);
```

Keyed variants (`SfereKeyed`, `SferePointKeyed`, …) let contributions be
addressed by an explicit key, and `SfereSelector` / `Sfere.builder` derive and
observe a projection of the aggregated state.

## Additional information

Built on [`zadart`](https://pub.dev/packages/zadart). Issues and contributions
are welcome at <https://github.com/anqit/sfere>.
