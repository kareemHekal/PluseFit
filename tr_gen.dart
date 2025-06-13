// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

void main() {
  const translationClassPath =
      'lib/core/utils/string_manager.dart'; // مسار StringManager.dart
  const translationsDir = 'assets/translations'; // مسار ملفات الترجمة
  const enJsonFile = '$translationsDir/en.json';
  const arJsonFile = '$translationsDir/ar.json';

  // تحميل ملفات JSON
  final enJson = loadJson(enJsonFile);
  final arJson = loadJson(arJsonFile);

  // استخراج جميع المفاتيح
  final keys = <String>{};
  extractKeys(enJson, '', keys);
  extractKeys(arJson, '', keys);

  // قراءة المفاتيح الموجودة مسبقًا في StringManager.dart
  final existingKeys = extractExistingKeys(translationClassPath);

  // تحديث الملف بإضافة المفاتيح الجديدة
  updateStringManagerClass(translationClassPath, keys, existingKeys);
}

/// تحميل ملف JSON وتحويله إلى Map
Map<String, dynamic> loadJson(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    print('❌ Error: File not found - $path');
    return {};
  }
  return json.decode(file.readAsStringSync()) as Map<String, dynamic>;
}

/// استخراج جميع المفاتيح من JSON (بما في ذلك المفاتيح المتداخلة)
void extractKeys(Map<String, dynamic> json, String prefix, Set<String> keys) {
  json.forEach((key, value) {
    final formattedKey = prefix.isEmpty ? key : '$prefix.$key';
    keys.add(formattedKey);
    if (value is Map<String, dynamic>) {
      extractKeys(value, formattedKey, keys);
    }
  });
}

/// استخراج المفاتيح الموجودة حاليًا داخل StringManager.dart
Set<String> extractExistingKeys(String filePath) {
  final file = File(filePath);
  if (!file.existsSync()) {
    return {};
  }

  final content = file.readAsStringSync();
  final regex =
      RegExp(r'static const String (\w+) = \"([^\"]+)\";', multiLine: true);
  final existingKeys = <String>{};

  for (final match in regex.allMatches(content)) {
    existingKeys.add(match.group(2)!);
  }

  return existingKeys;
}

/// تحديث ملف StringManager.dart بإضافة المفاتيح الجديدة
void updateStringManagerClass(
    String filePath, Set<String> jsonKeys, Set<String> existingKeys) {
  final file = File(filePath);

  // استخراج المفاتيح الجديدة غير الموجودة مسبقًا
  final newKeys = jsonKeys.difference(existingKeys);

  if (newKeys.isEmpty) {
    print('✅ No new keys found. StringManager is already up to date.');
    return;
  }

  print('➕ Adding ${newKeys.length} new keys...');

  final buffer = StringBuffer();
  buffer.writeln("import 'package:easy_localization/easy_localization.dart';");
  buffer.writeln('class AppStrings {');

  // الاحتفاظ بالمفاتيح القديمة كما هي
  for (final key in existingKeys) {
    buffer.writeln('  static String get ${formatKeyName(key)} => "$key".tr();');
  }

  // إضافة المفاتيح الجديدة
  for (final key in newKeys) {
    buffer.writeln('  static String get ${formatKeyName(key)} => "$key".tr();');
  }

  buffer.writeln('}');

  // كتابة التعديلات إلى الملف
  file.writeAsStringSync(buffer.toString());
  print('✅ StringManager has been successfully updated!');
}

/// تحويل مفتاح JSON إلى اسم متغير صالح في Dart (camelCase)
String formatKeyName(String key) {
  List<String> parts = key.split('.');

  // تحويل كل جزء إلى PascalCase أولًا
  parts = parts
      .map((part) => part
          .split('_')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(''))
      .toList();

  // تحويل أول حرف إلى lowercase (lowerCamelCase)
  String camelCaseName = parts.join('');
  camelCaseName = camelCaseName[0].toLowerCase() + camelCaseName.substring(1);

  return camelCaseName;
}
