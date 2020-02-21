
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todo_list/app/modules/nova_tarefa/nova_tarefa_page.dart';

main() {
  testWidgets('NovaTarefaPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(NovaTarefaPage(title: 'NovaTarefa')));
    final titleFinder = find.text('NovaTarefa');
    expect(titleFinder, findsOneWidget);
  });
}
  