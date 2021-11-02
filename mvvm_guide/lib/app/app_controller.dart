import 'package:flutter/cupertino.dart';

import 'shared/services/local-storage/local_storage_interface.dart';
import 'shared/services/local-storage/shared_local_storage_service.dart';
import 'shared/viewmodels/change_theme_viewmodel.dart';

class AppController {
  // Padrão Singleton (Pasando o Construtor Privado)
  static final AppController instance = AppController._();

  AppController._() {
    changeThemeViewModel.init();
  }

  // Instância do Model
  final ChangeThemeViewModel changeThemeViewModel =
      ChangeThemeViewModel(storage: SharedLocalStorageService());

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;

  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;

  // Instância do Storage
  final ILocalStorage storage = SharedLocalStorageService();
}
