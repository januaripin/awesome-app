import 'package:awesome_app/main.dart' as app;
import 'package:awesome_app/photos/presentation/controllers/photos_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on icon grid and list', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final gridFinder = find.byIcon(Icons.grid_view);
      final listFinder = find.byIcon(Icons.list);

      expect(gridFinder, findsOneWidget);
      expect(listFinder, findsOneWidget);

      await tester.tap(gridFinder);
      await tester.pumpAndSettle();

      expect(tester.getSize(gridFinder), equals(const Size(32, 32)));
      expect(tester.getSize(listFinder), equals(const Size(16, 16)));

      await tester.tap(listFinder);
      await tester.pumpAndSettle();

      expect(tester.getSize(gridFinder), equals(const Size(16, 16)));
      expect(tester.getSize(listFinder), equals(const Size(32, 32)));
    });

    testWidgets('scroll list', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final scrollFinder = find.byType(Scrollable);

      await tester.drag(scrollFinder, const Offset(0.0, -200.0));
      await tester.pumpAndSettle();

      expect(find.text('Awesome'), findsNothing);

      await tester.drag(scrollFinder, const Offset(0.0, 200.0));
      await tester.pumpAndSettle();

      expect(find.text('Awesome'), findsOneWidget);
    });

    testWidgets('retry from error', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      final controller = Get.find<PhotosController>();
      controller.photos.clear();
      controller.errorMessage.value = 'ini error';

      await tester.pumpAndSettle();

      expect(find.text('ini error'), findsOneWidget);
      expect(find.text('Retry'), findsOneWidget);

      await tester.tap(find.text('Retry'));
      await tester.pumpAndSettle();

      expect(find.text('ini error'), findsNothing);
      expect(find.text('Retry'), findsNothing);
    });
  });
}
