import 'package:semana_arch/app/shared/models/app_config_model.dart';
import 'package:semana_arch/app/shared/services/local-storage/local_storage_interface.dart';

class ChangeThemeViewModel {
  final ILocalStorage storage;

  ChangeThemeViewModel(this.storage);

  final AppConfigModel config = AppConfigModel();

  Future init() async {
    await storage.get('isDark').then((value) {
      if (value != null) config.themeSwitch.value = value;
    });
  }

  // Método
  changeTheme(bool value) {
    config.themeSwitch.value = value;
    // Temos que salvar a alteração do brightness localmente:
    // sharedPreferences, hive ou sqlite
    storage.put('isDark', value);
  }
}
