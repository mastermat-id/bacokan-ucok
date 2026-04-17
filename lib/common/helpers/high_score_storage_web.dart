import 'package:web/web.dart' as web;

const _highScoreKey = 'bacokan_ucok_high_score';

Future<int> loadHighScoreValueImpl() async {
  final stored = web.window.localStorage.getItem(_highScoreKey);
  return int.tryParse(stored ?? '') ?? 0;
}

Future<void> saveHighScoreValueImpl(int score) async {
  web.window.localStorage.setItem(_highScoreKey, score.toString());
}
