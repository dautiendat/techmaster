import 'package:flutter_test/flutter_test.dart';
import 'package:my_native/my_native.dart';
import 'package:my_native/my_native_platform_interface.dart';
import 'package:my_native/my_native_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyNativePlatform
    with MockPlatformInterfaceMixin
    implements MyNativePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyNativePlatform initialPlatform = MyNativePlatform.instance;

  test('$MethodChannelMyNative is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyNative>());
  });

  test('getPlatformVersion', () async {
    MyNative myNativePlugin = MyNative();
    MockMyNativePlatform fakePlatform = MockMyNativePlatform();
    MyNativePlatform.instance = fakePlatform;

    expect(await myNativePlugin.getPlatformVersion(), '42');
  });
}
