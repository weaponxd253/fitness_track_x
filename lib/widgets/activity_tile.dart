import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;

  ActivityTile(this.activity);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(activity.name),
      subtitle: Text('${activity.duration} min'),
      trailing: Text(activity.date.toLocal().toString().split(' ')[0]),
    );
  }
}
