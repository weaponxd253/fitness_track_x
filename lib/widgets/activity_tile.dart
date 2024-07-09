import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;

  ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(activity.name),
      subtitle: Text('Value: ${activity.value}'),
    );
  }
}
