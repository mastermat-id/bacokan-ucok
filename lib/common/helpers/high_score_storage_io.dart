import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<File> _getHighScoreFile() async {
  final directory = await getApplicationDocumentsDirectory();
  return File('${directory.path}/high_score.txt');
}

Future<int> loadHighScoreValueImpl() async {
  final file = await _getHighScoreFile();
  if (!await file.exists()) {
    return 0;
  }

  final content = await file.readAsString();
  return int.tryParse(content) ?? 0;
}

Future<void> saveHighScoreValueImpl(int score) async {
  final file = await _getHighScoreFile();
  await file.writeAsString(score.toString(), flush: true);
}
