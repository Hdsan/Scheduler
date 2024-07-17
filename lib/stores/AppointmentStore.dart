import 'package:mobx/mobx.dart';

part 'AppointmentStore.g.dart';

class AppointmentStore = _AppointmentStore with _$AppointmentStore;

abstract class _AppointmentStore with Store {
  @observable
  Appointment activeAppointment = Appointment(location: null, time: null, observation: null, status: null);


  @action
  void updateAppointment(Appointment appointment) {
    activeAppointment = appointment;
  }

  bool isLoaded() {
    if(activeAppointment.observation == "EMPTY"){
      return true;
    }
    else if(activeAppointment.location == null ||
        activeAppointment.time == null||
        activeAppointment.status == null){
      return false;
    }
    return true;
  }
  bool haveActive() {
    if(activeAppointment.observation == "EMPTY"){
      return false;
    }
    return true;
  }

}
class Appointment {
  final String ?location;
  final String ?time;
  final String ?observation;
  final String ?status;

  Appointment({
     this.location,
     this.time,
     this.observation,
     this.status,
  });
}