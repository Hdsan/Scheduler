import 'package:flutter/material.dart';
import 'package:scheduler/stores/AppointmentStore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(
                      Icons.directions_car,
                      size: 50.0,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Agendamento',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Local: ${appointment.location}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'Hora: ${appointment.time}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'Observação: ${appointment.observation}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'Status: ${appointment.status == "OK" ? 'Confirmado' : 'Pendente'}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                )
          ),
        ));
  }
}
