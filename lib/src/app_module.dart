import 'package:ShopList/src/configuration/configuration_page.dart';
import 'package:ShopList/src/home/home_module.dart';
import 'package:ShopList/src/stores/app_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  //criando os bindings de gerenciamento de estado
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => AppStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        //Dessa forma eu chamo o Meu home module nas rotas do aplicativo
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
        //Dessa forma eu chamo apenas uma pagina para a navegação
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}
