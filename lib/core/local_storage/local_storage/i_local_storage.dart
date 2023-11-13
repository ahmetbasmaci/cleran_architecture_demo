abstract class ILocalStorage {
  T? read<T>(String key);
  Future<void> write(String key, dynamic value);
  bool hasData(String key);
}
