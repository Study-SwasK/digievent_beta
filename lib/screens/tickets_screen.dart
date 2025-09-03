import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../providers/attendee_provider.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendeeProvider = Provider.of<AttendeeProvider>(context, listen: false);
    final attendee = attendeeProvider.attendee;

    if (attendee == null || attendee.name.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No attendee data. Please submit details first.')),
        );
        Navigator.pop(context);
      });
      return const SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Card(
          elevation: 4,
          color: Theme.of(context).colorScheme.surface,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coldplay: Music of the Spheres',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                Text(
                  'Jawaharlal Nehru Stadium, Delhi',
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          attendee.name,
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Phone',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          attendee.phone,
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Date',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          'March 09 2025',
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          'CLDP9738PL',
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Roll No',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          attendee.rollNo,
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Time',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '9:00 AM',
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Class',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          'Yellow',
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Seat',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          'West B',
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: 'CLDP9738PL',
                  width: double.infinity,
                  height: 50,
                  drawText: false,
                  color: Theme.of(context).colorScheme.onSurface,
                  errorBuilder: (context, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Scan your barcode at the entry.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}