import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list/app/app_controller.dart';
import 'package:todo_list/app/modules/grupos/grupos_page.dart';
import 'package:todo_list/app/modules/home/home_controller.dart';
import 'package:todo_list/app/modules/home/widgets/custom_bottom_navbar.dart';
import 'package:todo_list/app/modules/home/widgets/custom_bottom_sheet.dart';
import 'package:todo_list/app/modules/tarefa/tarefa_page.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  PageController _pageController;
  ReactionDisposer disposer;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: controller.pageIndex);
    disposer = reaction((_) => Modular.get<AppController>().pageIndex, (_) {
      changePage(Modular.get<AppController>().pageIndex);
    });
  }

  changePage(int index) {
    controller.setPageIndex(index);
    _pageController.animateToPage(index,
        curve: Curves.linear, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 40, 40, 40),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            controller.setPageIndex(value);
            Modular.get<AppController>().setPushToPage(pageIndex: value);
          },
          children: <Widget>[
            GruposPage(),
            TarefaPage(),
            Container(),
            Container(),
          ],
        ),
      ),
      floatingActionButton: Observer(
          name: 'floatingActionButton',
          builder: (BuildContext builder) {
            return FloatingActionButton(
              heroTag: controller.heroTag,
              backgroundColor: Colors.white,
              child: Icon(
                Feather.plus,
                color: Color.fromARGB(255, 78, 166, 231),
              ),
              onPressed: () async {
                controller.setHeroTag('');
                CustomBottomSheet _customBottomSheet = CustomBottomSheet(
                  context: context,
                );

                String retorno = await _customBottomSheet.showAsBottomSheet();
                if (retorno != null && retorno.isNotEmpty) {
                  controller.setHeroTag(retorno);
                }
              },
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Observer(
          name: 'CustomBottomNavBar',
          builder: (BuildContext builder) {
            return CustomBottomNavBar(
              currentIndex: controller.pageIndex,
              onTap: (value) {
                controller.setPageIndex(value);
                Modular.get<AppController>().setPushToPage(pageIndex: value);
                _pageController.jumpToPage(value);
              },
            );
          }),
    );
  }
}
