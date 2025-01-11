
import 'my_native_platform_interface.dart';

class MyNative {
  Future<String?> getPlatformVersion() {
    return MyNativePlatform.instance.getPlatformVersion();
  }
}
