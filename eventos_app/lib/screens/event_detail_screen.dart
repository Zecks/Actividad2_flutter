import 'package:flutter/material.dart';
import '../models/event.dart';

class EventDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context)!.settings.arguments as Event;

    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Categoría: ${event.category}'),
      ),
    );
  }
}
