import 'package:ShopList/src/stores/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');
    //escutando as mudanças de tema no aplicativo inteiro
    final appStore = context.watch<AppStore>(
      //Só ira alterar quando o themeMode for alterado
      (store) => store.themeMode,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: appStore.themeMode.value,
      //Propriedades para fazer o flutter modular rodar
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
