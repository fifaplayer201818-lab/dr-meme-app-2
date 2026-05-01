import 'package:device_info_plus/device_info_plus.dart';

class DeviceLimitService {
  static const int maxDevices = 2;

  Future<String> getDeviceId() async {
    final info = DeviceInfoPlugin();
    try {
      final android = await info.androidInfo;
      return android.id;
    } catch (_) {
      return 'demo-device';
    }
  }

  Future<bool> isDeviceAllowed(String userId) async {
    // TODO: Connect to Firestore:
    // devices/{userId}/user_devices/{deviceId}
    // If count < 2 allow, else block.
    return true;
  }
}
