import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';
import '../models/activity.dart';
import 'package:uuid/uuid.dart';

class ActivityScreen extends StatelessWidget {
  static const routeName = '/activity';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();

  void _saveForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final newActivity = Activity(
        id: Uuid().v4(),
        name: _nameController.text,
        duration: int.parse(_durationController.text),
        date: DateTime.now(),
      );

      Provider.of<ActivityProvider>(context, listen: false).addActivity(newActivity);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Activity Name'),
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a name.';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Duration (in minutes)'),
                controller: _durationController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please provide a duration.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _saveForm(context),
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
