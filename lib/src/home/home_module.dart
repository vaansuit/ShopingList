import 'package:ShopList/src/home/edit_task_board_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

//Sobreescrevendo as rotas do flutter utilizando modular routes
class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/edit',
          child: (context, args) => const EditTaskBoardPage(),
        ),
      ];
}
