import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventFormScreen extends StatefulWidget {
  @override
  _EventFormScreenState createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
  final titleController = TextEditingController();
  String selectedCategory = 'Música';
  String? lastEventSaved;

  @override
  void initState() {
    super.initState();
    loadLastEvent();
  }

  Future<void> saveEvent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastEvent', titleController.text);
    setState(() {
      lastEventSaved = titleController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Evento guardado')),
    );
  }

  Future<void> loadLastEvent() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      lastEventSaved = prefs.getString('lastEvent');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuevo Evento')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (lastEventSaved != null)
              Text('Último evento guardado: $lastEventSaved',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título del evento'),
            ),
            DropdownButton<String>(
              value: selectedCategory,
              items: ['Música', 'Teatro', 'Cultura']
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Guardar Evento'),
              onPressed: saveEvent,
            )
          ],
        ),
      ),
    );
  }
}
