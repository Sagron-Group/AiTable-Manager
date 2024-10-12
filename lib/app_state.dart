import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _apiKey = await secureStorage.getString('ff_apiKey') ?? _apiKey;
    });
    await _safeInitAsync(() async {
      _datasheets = (await secureStorage.getStringList('ff_datasheets'))
              ?.map((x) {
                try {
                  return DatasheetStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _datasheets;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _apiKey = '';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    secureStorage.setString('ff_apiKey', value);
  }

  void deleteApiKey() {
    secureStorage.delete(key: 'ff_apiKey');
  }

  List<DatasheetStruct> _datasheets = [];
  List<DatasheetStruct> get datasheets => _datasheets;
  set datasheets(List<DatasheetStruct> value) {
    _datasheets = value;
    secureStorage.setStringList(
        'ff_datasheets', value.map((x) => x.serialize()).toList());
  }

  void deleteDatasheets() {
    secureStorage.delete(key: 'ff_datasheets');
  }

  void addToDatasheets(DatasheetStruct value) {
    datasheets.add(value);
    secureStorage.setStringList(
        'ff_datasheets', _datasheets.map((x) => x.serialize()).toList());
  }

  void removeFromDatasheets(DatasheetStruct value) {
    datasheets.remove(value);
    secureStorage.setStringList(
        'ff_datasheets', _datasheets.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDatasheets(int index) {
    datasheets.removeAt(index);
    secureStorage.setStringList(
        'ff_datasheets', _datasheets.map((x) => x.serialize()).toList());
  }

  void updateDatasheetsAtIndex(
    int index,
    DatasheetStruct Function(DatasheetStruct) updateFn,
  ) {
    datasheets[index] = updateFn(_datasheets[index]);
    secureStorage.setStringList(
        'ff_datasheets', _datasheets.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDatasheets(int index, DatasheetStruct value) {
    datasheets.insert(index, value);
    secureStorage.setStringList(
        'ff_datasheets', _datasheets.map((x) => x.serialize()).toList());
  }

  List<JsonStruct> _jsonUpdater = [];
  List<JsonStruct> get jsonUpdater => _jsonUpdater;
  set jsonUpdater(List<JsonStruct> value) {
    _jsonUpdater = value;
  }

  void addToJsonUpdater(JsonStruct value) {
    jsonUpdater.add(value);
  }

  void removeFromJsonUpdater(JsonStruct value) {
    jsonUpdater.remove(value);
  }

  void removeAtIndexFromJsonUpdater(int index) {
    jsonUpdater.removeAt(index);
  }

  void updateJsonUpdaterAtIndex(
    int index,
    JsonStruct Function(JsonStruct) updateFn,
  ) {
    jsonUpdater[index] = updateFn(_jsonUpdater[index]);
  }

  void insertAtIndexInJsonUpdater(int index, JsonStruct value) {
    jsonUpdater.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
