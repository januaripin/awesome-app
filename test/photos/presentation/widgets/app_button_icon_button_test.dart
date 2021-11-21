import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:awesome_app/photos/presentation/widgets/app_bar_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import '../../../widget_test.dart';

void main() {
  setUp(() => Get.put(IconController()));

  testWidgets('icon button grid view', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
      child: Scaffold(
        body: AppBarIconButton(iconType: IconType.grid),
      ),
    ));

    final gridFinder = find.byIcon(Icons.grid_view);
    final listFinder = find.byIcon(Icons.list);

    expect(gridFinder, findsOneWidget);
    expect(listFinder, findsNothing);
  });

  testWidgets('icon button list view', (tester) async {
    await tester.pumpWidget(createWidgetForTesting(
      child: Scaffold(
        body: AppBarIconButton(iconType: IconType.list),
      ),
    ));

    final gridFinder = find.byIcon(Icons.grid_view);
    final listFinder = find.byIcon(Icons.list);

    expect(gridFinder, findsNothing);
    expect(listFinder, findsOneWidget);
  });
}
