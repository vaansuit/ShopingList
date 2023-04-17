import 'package:ShopList/src/configuration/service/configuration_service.dart';
import 'package:flutter/material.dart';

class AppStore {
  //criando um componente reativo
  //setando como tema inicial o tema do celular do cliente
  final themeMode = ValueNotifier(ThemeMode.system);

  //Resolvendo a questão da data de sincronização
  final syncDate = ValueNotifier<DateTime?>(null);

  final ConfigurationService _configurationService;

  AppStore(this._configurationService) {
    init();
  }

  //Iniciando os dados
  void init() {
    final model = _configurationService.getConfiguration();
    syncDate.value = model.syncDate;
    themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  //Salvando os dados
  void save() {
    _configurationService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  //metodo para fazer a modificacao, refatorado
  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  //Atribuindo valores ao syncDate que começa nulo
  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
