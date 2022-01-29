import 'package:flutter_test/flutter_test.dart';

import 'package:animated_shimmer/animated_shimmer.dart';

void main() {
  testWidgets('AnimatedShimmer() can be constructed', (tester) async {
    await tester.pumpWidget(
      const AnimatedShimmer(
        height: 200,
        width: 200,
      ),
    );
  });
}
