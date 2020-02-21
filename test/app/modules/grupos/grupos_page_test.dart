import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todo_list/app/modules/grupos/grupos_page.dart';

main() {
  testWidgets('GruposPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(GruposPage(title: 'Grupos')));
    final titleFinder = find.text('Grupos');
    expect(titleFinder, findsOneWidget);
  });
}
  