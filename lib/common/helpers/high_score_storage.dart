import 'high_score_storage_stub.dart'
    if (dart.library.io) 'high_score_storage_io.dart'
    if (dart.library.js_interop) 'high_score_storage_web.dart';

Future<int> loadHighScoreValue() => loadHighScoreValueImpl();

Future<void> saveHighScoreValue(int score) => saveHighScoreValueImpl(score);
