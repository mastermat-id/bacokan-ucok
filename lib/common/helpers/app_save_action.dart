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
    final result = win ? 'Menang' : 'Permainan Selesai';
    final url = Uri(
      scheme: 'mailto',
      path: 'mastermat711@gmail.com',
      queryParameters: {
        'subject': 'Hasil Bacokan Ucok: $time',
        'body':
            'Nama:\nMode: $mode\nSkor: $score\nStatus: $result\nWaktu: $time\n\nKirim screenshot hasil permainan pada email ini.',
      },
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Tidak dapat membuka $url';
    }
  }
}
