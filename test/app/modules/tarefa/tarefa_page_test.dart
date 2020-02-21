import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todo_list/app/modules/tarefa/tarefa_page.dart';

main() {
  testWidgets('TarefaPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(TarefaPage(title: 'Tarefa')));
    final titleFinder = find.text('Tarefa');
    expect(titleFinder, findsOneWidget);
  });
}
