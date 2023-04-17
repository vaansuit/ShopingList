import 'package:ShopList/src/configuration/configuration_page.dart';
import 'package:ShopList/src/configuration/service/configuration_service.dart';
import 'package:ShopList/src/home/home_module.dart';
import 'package:ShopList/src/services/realm/realm_config.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

import 'stores/app_store.dart';

class AppModule extends Module {
  //criando os bindings de gerenciamento de estado
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        AutoBind.factory<ConfigurationService>(
          ConfigurationServiceImpl.new,
        ),
        AutoBind.singleton(AppStore.new)
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
