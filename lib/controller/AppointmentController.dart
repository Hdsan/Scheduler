import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scheduler/stores/AppointmentStore.dart';

class AppointmentController {

  Future<Appointment> getAppointment(String userId) async {
    Map<String, String> data = {
      'user_id': userId,
    };

    try {
      var response = await http.get(
          Uri.parse('http://192.168.100.196:3000/schedules')
      );

      if(response.statusCode == 204){
        return Appointment(observation: "EMPTY");
      }
      var jsonResponse = jsonDecode(response.body);
      return Appointment(location: jsonResponse["location"],
          time: jsonResponse["time"],
          observation: jsonResponse["observation"],
          status: jsonResponse["status"]);
    } catch (e) {
      print('Erro ao enviar requisição: $e');
      return Appointment();
    }
  }
}