import 'package:awesome_app/photos/presentation/controllers/icon_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('toggle the state of layout', (tester) async {
    final controller = IconController();

    controller.changeType(IconType.grid);
    expect(controller.iconType.value, IconType.grid);

    controller.changeType(IconType.list);
    expect(controller.iconType.value, IconType.list);
  });
}
