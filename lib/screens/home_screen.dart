import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';
import '../widgets/activity_tile.dart';
import './activity_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<ActivityProvider>(context).activities;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Tracker'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (ctx, i) => ActivityTile(activities[i]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(ActivityScreen.routeName);
        },
      ),
    );
  }
}
