import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/attendee_provider.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/attendee_details_screen.dart';
import 'screens/tickets_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AttendeeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailsScreen(),
        '/attendee_details': (context) => const AttendeeDetailsScreen(),
        '/tickets': (context) => const TicketsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
