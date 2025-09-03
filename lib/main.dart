import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/attendee_provider.dart';
import 'screens/home_screen.dart';
import 'screens/details_screen.dart';
import 'screens/attendee_details_screen.dart';
import 'screens/tickets_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/splash_screen.dart';
import 'theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AttendeeProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Digievent',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.light,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF6A1B9A),
              secondary: Color(0xFFAB47BC),
            ),
          ),
          darkTheme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFAB47BC),
              secondary: Color(0xFF6A1B9A),
            ),
          ),
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/auth': (context) => const AuthScreen(),
            '/home': (context) => const HomeScreen(),
            '/details': (context) => const DetailsScreen(),
            '/attendee_details': (context) => const AttendeeDetailsScreen(),
            '/tickets': (context) => const TicketsScreen(),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}