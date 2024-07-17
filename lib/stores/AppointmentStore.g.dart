// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppointmentStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppointmentStore on _AppointmentStore, Store {
  late final _$activeAppointmentAtom =
      Atom(name: '_AppointmentStore.activeAppointment', context: context);

  @override
  Appointment get activeAppointment {
    _$activeAppointmentAtom.reportRead();
    return super.activeAppointment;
  }

  @override
  set activeAppointment(Appointment value) {
    _$activeAppointmentAtom.reportWrite(value, super.activeAppointment, () {
      super.activeAppointment = value;
    });
  }

  late final _$_AppointmentStoreActionController =
      ActionController(name: '_AppointmentStore', context: context);

  @override
  void updateAppointment(Appointment appointment) {
    final _$actionInfo = _$_AppointmentStoreActionController.startAction(
        name: '_AppointmentStore.updateAppointment');
    try {
      return super.updateAppointment(appointment);
    } finally {
      _$_AppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeAppointment: ${activeAppointment}
    ''';
  }
}
