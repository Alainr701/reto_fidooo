// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeviceController on DeviceControllerBase, Store {
  late final _$_deviceAtom =
      Atom(name: 'DeviceControllerBase._device', context: context);

  DeviceEntity get device {
    _$_deviceAtom.reportRead();
    return super._device;
  }

  @override
  DeviceEntity get _device => device;

  @override
  set _device(DeviceEntity value) {
    _$_deviceAtom.reportWrite(value, super._device, () {
      super._device = value;
    });
  }

  late final _$DeviceControllerBaseActionController =
      ActionController(name: 'DeviceControllerBase', context: context);

  @override
  void updateSize(Size size) {
    final _$actionInfo = _$DeviceControllerBaseActionController.startAction(
        name: 'DeviceControllerBase.updateSize');
    try {
      return super.updateSize(size);
    } finally {
      _$DeviceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
