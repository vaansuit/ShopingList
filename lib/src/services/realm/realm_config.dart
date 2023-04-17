import 'package:ShopList/src/services/realm/models/configuration_model.dart';
import 'package:realm/realm.dart';

import 'models/task_model.dart';

LocalConfiguration config = Configuration.local(
  [
    ConfigurationModel.schema,
    Task.schema,
    TaskBoard.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
);
