import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Event> events = [];
  String selectedCity = 'Madrid';

  @override
  void initState() {
    super.initState();
    // Cargar eventos desde API o json local aquí
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eventos en $selectedCity')),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedCity,
            items: ['Madrid', 'Barcelona', 'Valencia']
                .map((city) => DropdownMenuItem(value: city, child: Text(city)))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedCity = value!;
              });
            },
          ),
          Expanded(
            child: ListView(
              children: events.map((e) => EventCard(event: e)).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        child: Text('Añadir Evento'),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
    );
  }
}
