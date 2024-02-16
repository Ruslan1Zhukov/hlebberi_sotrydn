import 'package:intl/intl.dart';

const _setStringToBool = {
  "true",
  "1",
};

extension ParserJsonStringExtension on Map<String, dynamic> {
  String getString(String key) {
    final value = getStringOrNull(key);
    if (value == null) return throw ParsingException("String", key, this);
    return value;
  }

  String? getStringOrNull(String key) {
    final value = this[key];
    if (value == null) return null;
    if (value is String) return value.trim();
    if (value is int) return value.toString();
    if (value is double) return value.toString();
    if (value is bool) return value ? "да" : "нет";
    return null;
  }
}

extension ParserJsonBoolExtension on Map<String, dynamic> {
  bool getBool(String key) {
    final value = getBoolOrNull(key);
    if (value == null) return throw ParsingException("bool", key, this);
    return value;
  }

  bool? getBoolOrNull(String key) {
    var value = this[key];
    if (value == null) return null;
    if (value is bool) return value;
    if (value is String) return _setStringToBool.contains(value.toLowerCase());
    if (value is int) return value >= 1;
    return false;
  }
}

extension ParserJsonIntExtension on Map<String, dynamic> {
  int getInt(String key) {
    final value = getIntOrNull(key);
    if (value == null) return throw ParsingException("int", key, this);
    return value;
  }

  int? getIntOrNull(String key) {
    var value = this[key];
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    if (value is double) return value.toInt();
    return null;
  }
}

extension ParserJsonDoubleExtension on Map<String, dynamic> {
  double getDouble(String key) {
    final value = getDoubleOrNull(key);
    if (value == null) return throw ParsingException("double", key, this);
    return value;
  }

  double? getDoubleOrNull(String key) {
    var value = this[key];
    if (value == null) return null;
    if (value is double) return value;
    if (value is String) return double.tryParse(value);
    if (value is int) return value.toDouble();
    return null;
  }
}

extension ParserJsonDateTimeExtension on Map<String, dynamic> {
  DateTime getDateTime(String key) {
    final value = getDateTimeOrNull(key);
    if (value == null) return throw ParsingException("DateTime", key, this);
    return value;
  }

  DateTime getDateTimeOrNow(String key) {
    return getDateTimeOrNull(key) ?? DateTime.now();
  }

  DateTime? getDateTimeOrNull(String key) {
    var value = this[key];
    if (value == null) return null;
    if (value is String) return _parseDateString(value);
    if (value is DateTime) return value;
    return null;
  }
}

extension ParserJsonListExtension on Map<String, dynamic> {
  List<V> getList<V>({
    required String key,
    required V Function(dynamic item) converter,
  }) {
    final list = this[key];
    if (list == null) [];
    if (list is List) {
      return list.map((element) => converter(element)).toList();
    }
    if (list is Map) if (list.isEmpty) return [];
    return [];
  }
}

extension ParserJsonMapExtension on Map<String, dynamic> {
  Map<K, V> getMap<K, V>({
    required String key,
    required V Function(dynamic item) converter,
  }) {
    final map = this[key];
    if (map == null) return {};
    if (map is Map) {
      return map.map((k, v) => MapEntry(k, converter(v)));
    }
    if (map is List) if (map.isEmpty) return {};
    return {};
  }
}

extension ParserJsonSetExtension on Map<String, dynamic> {
  Set<V> getSet<V>({
    required String key,
    required V Function(dynamic item) converter,
  }) {
    final set = this[key];
    if (set == null) return {};
    if (set is Map) {
      final values = set.values.toList();
      return values.map((element) => converter(element)).toList().toSet();
    }
    if (set is List) {
      return set.map((element) => converter(element)).toList().toSet();
    }
    return {};
  }
}

DateTime? _parseDateString(String value) {
  try {
    return DateFormat("yyyy-MM-dd HH:mm:ss").parseLoose(value);
  } catch (e) {
    try {
      return DateFormat("yyyy-MM-dd").parseLoose(value);
    } catch (e) {
      try {
        return DateFormat("dd.MM.yyyy").parseLoose(value);
      } catch (e) {
        return null;
      }
    }
  }
}

class ParsingException implements Exception {
  final String type;
  final String key;
  final Map<String, dynamic> json;

  ParsingException(this.type, this.key, this.json);

  @override
  String toString() {
    return "Невозможно распарсить $type по ключу $key\n$json";
  }
}
