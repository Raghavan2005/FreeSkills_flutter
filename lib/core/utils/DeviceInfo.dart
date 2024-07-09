import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Deviceinfo {
  Future<String> getDeviceAndAppDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String deviceInfo;
    String appInfo = 'App Info:\n'
        'App Name: ${packageInfo.appName}\n'
        'Package Name: ${packageInfo.packageName}\n'
        'Version: ${packageInfo.version}\n'
        'Build Number: ${packageInfo.buildNumber}\n';

    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo =
            await deviceInfoPlugin.androidInfo;
        deviceInfo = _formatAndroidInfo(androidInfo);
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        deviceInfo = _formatIosInfo(iosInfo);
      } else {
        deviceInfo = 'Unsupported platform';
      }
    } catch (e) {
      deviceInfo = 'Failed to get device info: $e';
    }

    return '$appInfo\n$deviceInfo';
  }

  String _formatAndroidInfo(AndroidDeviceInfo info) {
    return 'Android Device Info:\n'
        'Brand: ${info.brand}\n'
        'Device: ${info.device}\n'
        'Model: ${info.model}\n'
        'Android Version: ${info.version.release}\n'
        'API Level: ${info.version.sdkInt}\n'
        'Manufacturer: ${info.manufacturer}\n'
        'Product: ${info.product}\n'
        'Hardware: ${info.hardware}\n'
        'Fingerprint: ${info.fingerprint}\n';
  }

  String _formatIosInfo(IosDeviceInfo info) {
    return 'iOS Device Info:\n'
        'Name: ${info.name}\n'
        'System Name: ${info.systemName}\n'
        'System Version: ${info.systemVersion}\n'
        'Model: ${info.model}\n'
        'Identifier: ${info.identifierForVendor}\n'
        'Is Physical Device: ${info.isPhysicalDevice}\n';
  }
}
