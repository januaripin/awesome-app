import 'package:awesome_app/photos/presentation/pages/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../widget_test.dart';

void main() {
  testWidgets('toggle layout photos change icon size', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        createWidgetForTesting(child: PhotosPage()),
        const Duration(seconds: 1),
      ),
    );

    final gridFinder = find.byIcon(Icons.grid_view);
    final listFinder = find.byIcon(Icons.list);

    expect(tester.getSize(gridFinder), equals(const Size(32, 32)));
    expect(tester.getSize(listFinder), equals(const Size(16, 16)));

    await tester.tap(listFinder);
    await tester.pump();

    expect(tester.getSize(gridFinder), equals(const Size(16, 16)));
    expect(tester.getSize(listFinder), equals(const Size(32, 32)));
  });

  testWidgets('scroll test', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        createWidgetForTesting(child: PhotosPage()),
        const Duration(seconds: 1),
      ),
    );

    final scrollFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const Key('10'));

    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: scrollFinder,
    );

    expect(itemFinder, findsOneWidget);
  });
}
