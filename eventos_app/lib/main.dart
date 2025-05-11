import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/event_form_screen.dart';
import 'screens/event_detail_screen.dart';

void main() {
  runApp(EventosApp());
}

class EventosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventos App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => EventFormScreen(),
        '/details': (context) => EventDetailScreen(),
      },
    );
  }
}
