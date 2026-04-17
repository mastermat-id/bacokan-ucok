import 'dart:typed_data';

import 'screenshot_saver_stub.dart'
    if (dart.library.io) 'screenshot_saver_io.dart'
    if (dart.library.js_interop) 'screenshot_saver_web.dart';

Future<void> saveScreenshot(Uint8List pngBytes) => saveScreenshotImpl(pngBytes);
