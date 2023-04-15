import 'package:ShopList/src/stores/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({Key? key}) : super(key: key);

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop-List'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: appStore.themeMode.value,
              title: const Text('Sistema'),
              onChanged: (mode) {
                appStore.themeMode.value = mode!;
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: appStore.themeMode.value,
              title: const Text('Tema Claro'),
              onChanged: (mode) {
                appStore.themeMode.value = mode!;
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: appStore.themeMode.value,
              title: const Text('Tema Escuro'),
              onChanged: (mode) {
                appStore.themeMode.value = mode!;
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Controle de dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Apagar cache e reiniciar app'),
            ),
          ],
        ),
      ),
    );
  }
}
