import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/modules/grupos/widgets/item_grupo_widget.dart';

class ListGrupoWidget extends StatelessWidget {
  const ListGrupoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Observer(
  builder: (BuildContext context) {
    return Modular.get<AppController>().listaGrupos != null
      ? AnimationLimiter(
          child: StaggeredGridView.countBuilder(
            physics: BouncingScrollPhysics(),
            crossAxisCount: 4,
            itemCount: Modular.get<AppController>().listaGrupos.length,
            itemBuilder: (BuildContext context, int index) =>
                AnimationConfiguration.staggeredGrid(
              duration: const Duration(milliseconds: 375),
              child: ScaleAnimation(
                child: ItemGrupoWidget(
                  grupo: Modular.get<AppController>().listaGrupos[index],
                ),
              ),
              columnCount: 2,
              position: index,
            ),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        )
      : Center(child: Text('Não há grupos, toque no "+" para incluir'));
  });
}
