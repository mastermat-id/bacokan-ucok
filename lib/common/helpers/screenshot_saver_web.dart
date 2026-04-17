import 'dart:typed_data';

import 'package:web/web.dart' as web;

Future<void> saveScreenshotImpl(Uint8List pngBytes) async {
  final dataUrl = Uri.dataFromBytes(pngBytes, mimeType: 'image/png').toString();
  final anchor = web.HTMLAnchorElement()
    ..href = dataUrl
    ..download = 'screenshot.png';
  anchor.click();
}
