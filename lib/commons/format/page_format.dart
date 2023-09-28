import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reto/commons/controllers/device_controller.dart';

class DeviceListener extends StatefulWidget {
  const DeviceListener({super.key, required this.child});
  final Widget child;

  @override
  State<DeviceListener> createState() => _DeviceListenerState();
}

class _DeviceListenerState extends State<DeviceListener> {
  @override
  void didChangeDependencies() {
    final deviceController = Modular.get<DeviceController>();
    deviceController.updateSize(MediaQuery.of(context).size);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final deviceController = Modular.get<DeviceController>();
    return SizedBox(
        width: deviceController.device.width,
        height: deviceController.device.height,
        child: widget.child);
  }
}
