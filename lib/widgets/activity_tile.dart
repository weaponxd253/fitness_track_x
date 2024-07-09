import 'package:flutter/material.dart';
import '../models/activity.dart';
import 'package:intl/intl.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;

  ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(activity.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Value: ${activity.value}'),
          Text('Duration: ${activity.duration} minutes'),
          Text('Date: ${DateFormat.yMd().format(activity.date)}'),
          Text('Type: ${activity.type}'),
        ],
      ),
    );
  }
}
