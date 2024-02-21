import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions({
  bool requestStorage = false,
  bool requestPhotos = false,
  bool requestLocation = false,
}) async {
  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;

    if (androidInfo.version.sdkInt <= 32) {
      if (requestStorage) {
        PermissionStatus storagePermission = await Permission.storage.status;
        if (storagePermission.isDenied ||
            storagePermission.isRestricted ||
            !storagePermission.isGranted) {
          await Permission.storage.request();
        }
      }
    } else {
      if (requestPhotos) {
        PermissionStatus photosPermission = await Permission.photos.status;
        if (photosPermission.isDenied ||
            photosPermission.isRestricted ||
            !photosPermission.isGranted) {
          await Permission.photos.request();
        }
      }
    }
  }

  if (requestLocation) {
    PermissionStatus locationPermission = await Permission.location.status;
    if (locationPermission.isDenied ||
        locationPermission.isRestricted ||
        !locationPermission.isGranted) {
      await Permission.location.request();
    }
  }
}
