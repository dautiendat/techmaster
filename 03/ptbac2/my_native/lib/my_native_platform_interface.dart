import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_native_method_channel.dart';

abstract class MyNativePlatform extends PlatformInterface {
  /// Constructs a MyNativePlatform.
  MyNativePlatform() : super(token: _token);

  static final Object _token = Object();

  static MyNativePlatform _instance = MethodChannelMyNative();

  /// The default instance of [MyNativePlatform] to use.
  ///
  /// Defaults to [MethodChannelMyNative].
  static MyNativePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyNativePlatform] when
  /// they register themselves.
  static set instance(MyNativePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
