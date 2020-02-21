
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todo_list/app/modules/calendario/calendario_page.dart';

main() {
  testWidgets('CalendarioPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(CalendarioPage(title: 'Calendario')));
    final titleFinder = find.text('Calendario');
    expect(titleFinder, findsOneWidget);
  });
}
  