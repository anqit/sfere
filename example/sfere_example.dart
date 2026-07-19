import 'package:flutter/material.dart';
import 'package:sfere/sfere.dart';

/// A scope whose builder rebuilds as [SferePoint]s beneath it contribute values.
class ContributionCount extends StatelessWidget {
  const ContributionCount({super.key});

  @override
  Widget build(BuildContext context) => CustomSfere<int>(
        child: Column(
          children: [
            // Rebuilds whenever the aggregated set of values changes.
            CustomSfereBuilder<int>(
              builder: (context, values) =>
                  Text('contributed: ${values.length}'),
            ),
            // Each point contributes one value into the enclosing scope.
            SferePoint<int>(value: 1, child: const SizedBox.shrink()),
            SferePoint<int>(value: 2, child: const SizedBox.shrink()),
          ],
        ),
      );
}
