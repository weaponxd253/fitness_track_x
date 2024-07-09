import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';
import '../models/activity.dart';

class NewWorkoutScreen extends StatefulWidget {
  static const routeName = '/new-workout';

  @override
  _NewWorkoutScreenState createState() => _NewWorkoutScreenState();
}

class _NewWorkoutScreenState extends State<NewWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _valueController = TextEditingController();

  void _saveWorkout() {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text;
      final value = int.tryParse(_valueController.text) ?? 0;

      final newActivity = Activity(id: DateTime.now().toString(), name: name, value: value);

      Provider.of<ActivityProvider>(context, listen: false).addActivity(newActivity);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Workout Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a workout name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valueController,
                decoration: InputDecoration(labelText: 'Value'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveWorkout,
                child: Text('Save Workout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
