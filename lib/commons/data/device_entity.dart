enum DeviceType { mobile, tablet, desktop, indeterminate }

class DeviceEntity {
  DeviceEntity(
      {this.width = 0,
      this.height = 0,
      this.deviceType = DeviceType.indeterminate});

  double width;
  double height;
  DeviceType deviceType;
}
