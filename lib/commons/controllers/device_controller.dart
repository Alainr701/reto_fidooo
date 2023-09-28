import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:reto/commons/data/device_entity.dart';

part 'device_controller.g.dart';

class DeviceController = DeviceControllerBase with _$DeviceController;

abstract class DeviceControllerBase with Store {
  @readonly
  // ignore: prefer_final_fields
  DeviceEntity _device = DeviceEntity();

  @action
  void updateSize(Size size) {
    const double minSizeForTablet = 768.0;
    const double minSizeForDesktop = 1000.0;
    DeviceType newDeviceType = DeviceType.indeterminate;
    if (size.width < minSizeForDesktop) {
      if (size.width < minSizeForTablet) {
        newDeviceType = DeviceType.mobile;
      } else {
        newDeviceType = DeviceType.tablet;
      }
    } else {
      newDeviceType = DeviceType.desktop;
    }
    _device.width = size.width;
    _device.height = size.height;
    if (newDeviceType != _device.deviceType) {
      _device.deviceType = newDeviceType;
    }
  }
}
