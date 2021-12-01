import 'package:awesome_app/photos/domain/entities/photo.dart';
import 'package:awesome_app/photos/domain/entities/photo_src.dart';
import 'package:awesome_app/photos/presentation/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../widget_test.dart';

void main() {
  testWidgets('photo item widget', (tester) async {
    tester.binding.window.devicePixelRatioTestValue = (2.625);
    tester.binding.window.textScaleFactorTestValue = (1.1);

    final dpi = tester.binding.window.devicePixelRatio;
    tester.binding.window.physicalSizeTestValue = Size(
      360 * dpi,
      640 * dpi,
    );

    const photo = Photo(
      id: 1,
      photographer: 'Photographer1',
      src: PhotoSrc(),
    );
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        createWidgetForTesting(child: const PhotoItem(photo: photo)),
      ),
    );

    expect(find.byKey(const Key('1')), findsOneWidget);
    expect(find.text('Photographer1'), findsOneWidget);
  });
}
