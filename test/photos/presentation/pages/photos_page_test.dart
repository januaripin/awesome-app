import 'package:awesome_app/main.dart';
import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/entities/photo_src.dart';
import 'package:awesome_app/photos/presentation/controllers/photos_controller.dart';
import 'package:awesome_app/photos/presentation/pages/photos_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../widget_test.dart';

void main() {
  setUp(() => di());

  testWidgets('toggle layout photos change icon size', (tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        createWidgetForTesting(child: PhotosPage()),
        const Duration(seconds: 10),
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
    final photos = <Photo>[];

    for (var i = 1; i <= 15; i++) {
      photos.add(
        Photo(
          id: i,
          width: 720,
          height: 600,
          photographerId: i,
          photographer: 'Photographer $i',
          src: const PhotoSrc(),
        ),
      );
    }

    final controller = Get.put(PhotosController());
    controller.photos.addAll(photos);

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        createWidgetForTesting(child: PhotosPage()),
        const Duration(seconds: 10),
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
