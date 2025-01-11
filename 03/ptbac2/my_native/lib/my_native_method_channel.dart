import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_native_platform_interface.dart';

/// An implementation of [MyNativePlatform] that uses method channels.
class MethodChannelMyNative extends MyNativePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_native');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
