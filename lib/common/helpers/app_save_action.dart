import 'package:url_launcher/url_launcher.dart';

class GitHubService {
  final String mode;
  final bool win;
  final String time;
  final String score;

  GitHubService({
    required this.time,
    required this.score,
    required this.mode,
    required this.win,
  });

  Future<void> createIssue() async {
    final result = win ? 'Win' : 'Game Over';
    final url = Uri(
      scheme: 'mailto',
      path: 'mastermat711@gmail.com',
      queryParameters: {
        'subject': 'Bacokan Ucok Result: $time',
        'body':
            'Nama:\nMode: $mode\nSkor: $score\nStatus: $result\nWaktu: $time\n\nKirim screenshot hasil permainan pada email ini.',
      },
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
