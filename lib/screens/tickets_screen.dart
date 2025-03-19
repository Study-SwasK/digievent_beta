import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../providers/attendee_provider.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendeeProvider =
        Provider.of<AttendeeProvider>(context, listen: false);
    final attendee = attendeeProvider.attendee;

    if (attendee == null || attendee.name.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No attendee data. Please submit details first.')),
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
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Coldplay: Music of the Spheres',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text('Gelora Bung Karno Stadium, Jakarta'),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Name',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(attendee.name),
                        const SizedBox(height: 8.0),
                        const Text('Phone',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(attendee.phone),
                        const SizedBox(height: 8.0),
                        const Text('Date',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text('March 09 2025'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Order Number',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text('CLDP9738PL'),
                        const SizedBox(height: 8.0),
                        const Text('Roll No',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(attendee.rollNo),
                        const SizedBox(height: 8.0),
                        const Text('Time',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text('9:00 AM'),
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
                      children: const [
                        Text('Class',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Yellow'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Seat',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('West B'),
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
                  errorBuilder: (context, error) => const Icon(Icons.error),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Scan your barcode at the entry.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
