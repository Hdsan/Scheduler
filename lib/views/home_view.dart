import 'package:flutter/material.dart';
import 'package:scheduler/components/appointment_card.dart';
import 'package:scheduler/controller/AppointmentController.dart';
import 'package:scheduler/stores/AppointmentStore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Appointment appointment;
  final appointmentController = AppointmentController();
  final AppointmentStore appointmentStore = AppointmentStore();
  @override
  void initState() {
    super.initState();
    loadAppointment();
  }

  Future<void> loadAppointment() async {
    final Appointment appointmentLoad =
        await appointmentController.getAppointment("user_id2134");
    setState(() {
      appointmentStore.updateAppointment(appointmentLoad);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          child: Observer(builder: (_) {
            if (appointmentStore.isLoaded()) {
              if (appointmentStore.haveActive()) {
                return AppointmentCard(
                    appointment: appointmentStore.activeAppointment);
              } else {
                return FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        String? selectedColor = 'verde';
                        return Container(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () async {
                                  final DateTime? selectedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (selectedDate != null) {
                                    //TODO
                                  }
                                },
                                child: const Text('Selecionar Data'),
                              ),
                              const SizedBox(height: 10.0),
                              const TextField(
                                decoration: InputDecoration(labelText: 'Texto'),
                              ),
                              DropdownButton<String>(
                                value: selectedColor,
                                onChanged: (String? newValue) {
                                  // setState(() {
                                  selectedColor = newValue;
                                  // });
                                },
                                items: <String>['verde', 'vermelho', 'azul']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 20.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Salvar',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.redAccent,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Fechar',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.add),
                );
              }
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
