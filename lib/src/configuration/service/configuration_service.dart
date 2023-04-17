import 'package:ShopList/src/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

abstract class ConfigurationService {
  ConfigurationModel getConfiguration();
  void saveConfiguration(String themModeName, DateTime? date);
  void deleteAll();
}

//Implementando os contratos das configurações de tema
class ConfigurationServiceImpl implements ConfigurationService {
  final Realm realm;

  ConfigurationServiceImpl(this.realm);

  @override
  ConfigurationModel getConfiguration() {
    return realm.all<ConfigurationModel>().first;
  }

  @override
  void saveConfiguration(String themModeName, DateTime? date) {
    final model = getConfiguration();
    realm.write(() {
      model.themeModeName = themModeName;
      model.syncDate = date;
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }
}
