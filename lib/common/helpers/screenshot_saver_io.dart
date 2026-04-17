import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

Future<void> saveScreenshotImpl(Uint8List pngBytes) async {
  final directory = await getApplicationDocumentsDirectory();
  final imagePath = '${directory.path}/screenshot.png';
  final imageFile = File(imagePath);
  await imageFile.writeAsBytes(pngBytes);
}
