import 'package:flutter/material.dart';

class AppStore {
  //criando um componente reativo
  //setando como tema inicial o tema do celular do cliente
  final themeMode = ValueNotifier(ThemeMode.system);

  //Resolvendo a questão da data de sincronização
  final syncDate = ValueNotifier<DateTime?>(null);

  AppStore();

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

  //Iniciando os dados
  void init() {}

  //Salvando os dados
  void save() {}
}
