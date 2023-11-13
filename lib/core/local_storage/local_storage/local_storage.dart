import 'package:get_storage/get_storage.dart';

import 'i_local_storage.dart';

class LocalStorage implements ILocalStorage {
    GetStorage storage = GetStorage();
  @override
  T? read<T>(String key) {
    return storage.read<T>(key);
  }

  @override
  Future<void> write(String key, dynamic value) async {
    await storage.write(key, value);
  }

  @override
  bool hasData(String key) {
    return storage.hasData(key);
  }
}
