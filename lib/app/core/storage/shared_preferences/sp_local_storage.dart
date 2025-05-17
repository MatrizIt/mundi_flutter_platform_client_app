import 'package:shared_preferences/shared_preferences.dart';
import '../local_storage.dart';

class SpLocalStorage implements LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sp = await _instance;
    sp.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sp = await _instance;
    return sp.containsKey(key);
  }

  @override
  Future<V?> read<V>(String key) async {
    final sp = await _instance;
    return sp.get(key) as V?;
  }

  @override
  Future<void> remove(String key) async {
    final sp = await _instance;
    await sp.remove(key);
  }

  @override
  Future<void> write<V>(String key, V value) async {
    final sp = await _instance;
    switch (V) {
      case String:
        await sp.setString(key, value as String);
        break;
      case double:
        await sp.setDouble(key, value as double);
        break;
      case int:
        await sp.setInt(key, value as int);
        break;
      case const (List<String>):
        await sp.setStringList(key, value as List<String>);
        break;
      case bool:
        await sp.setBool(key, value as bool);
        break;
    }
  }
}