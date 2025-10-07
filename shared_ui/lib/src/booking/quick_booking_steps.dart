import 'package:flutter/material.dart';
import 'package:shared_models/shared_models.dart';

typedef OnConfirmBooking = void Function({
  required Service service,
  required int durationMinutes,
  required DateTime schedule,
});

class QuickBookingSteps extends StatefulWidget {
  final List<Service> services;
  final OnConfirmBooking onConfirm;

  const QuickBookingSteps({super.key, required this.services, required this.onConfirm});

  @override
  State<QuickBookingSteps> createState() => _QuickBookingStepsState();
}

class _QuickBookingStepsState extends State<QuickBookingSteps> {
  int current = 0;
  Service? selectedService;
  int duration = 60;
  DateTime? schedule;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: current,
      onStepContinue: () {
        if (current == 0 && selectedService == null) return;
        if (current == 1 && duration <= 0) return;
        if (current == 2) {
          if (selectedService != null && schedule != null) {
            widget.onConfirm(
              service: selectedService!,
              durationMinutes: duration,
              schedule: schedule!,
            );
          }
          return;
        }
        setState(() => current += 1);
      },
      onStepCancel: () {
        if (current > 0) setState(() => current -= 1);
      },
      steps: [
        Step(
          title: const Text('Pilih Layanan'),
          content: DropdownButtonFormField<Service>(
            value: selectedService,
            items: widget.services
                .map((s) => DropdownMenuItem(value: s, child: Text(s.name)))
                .toList(),
            onChanged: (v) => setState(() => selectedService = v),
            decoration: const InputDecoration(labelText: 'Layanan'),
          ),
        ),
        Step(
          title: const Text('Durasi'),
          content: Row(
            children: [
              Expanded(
                child: Slider(
                  value: duration.toDouble(),
                  min: 30,
                  max: 240,
                  divisions: 7,
                  label: '$duration menit',
                  onChanged: (v) => setState(() => duration = v.round()),
                ),
              ),
              SizedBox(width: 64, child: Text('$duration m')),
            ],
          ),
        ),
        Step(
          title: const Text('Jadwal'),
          content: ElevatedButton.icon(
            icon: const Icon(Icons.schedule),
            label: Text(schedule == null
                ? 'Pilih Tanggal & Waktu'
                : '${schedule!.toLocal()}'.split('.')[0]),
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 30)),
                initialDate: DateTime.now().add(const Duration(days: 1)),
              );
              if (date == null) return;
              final time = await showTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 9, minute: 0),
              );
              if (time == null) return;
              setState(() {
                schedule = DateTime(date.year, date.month, date.day, time.hour, time.minute);
              });
            },
          ),
        ),
      ],
    );
  }
}