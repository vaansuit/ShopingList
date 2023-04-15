import 'package:flutter/material.dart';

class AppStore {
  //criando um componente reativo
  //setando como tema inicial o tema do celular do cliente
  final themeMode = ValueNotifier(ThemeMode.system);
  //metodo para fazer a modificacao, refatorado
  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
    }
  }
}
