
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:todo_list/app/modules/novo_grupo/novo_grupo_page.dart';

main() {
  testWidgets('NovoGrupoPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(NovoGrupoPage(title: 'NovoGrupo')));
    final titleFinder = find.text('NovoGrupo');
    expect(titleFinder, findsOneWidget);
  });
}
  