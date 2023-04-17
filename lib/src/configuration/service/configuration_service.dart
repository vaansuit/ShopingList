import 'package:ShopList/src/services/realm/models/configuration_model.dart';

abstract class ConfigurationService {
  ConfigurationModel getConfigurationModel();
  void saveConfiguration(String themModeName, DateTime? date);
  void deleteAll();
}
