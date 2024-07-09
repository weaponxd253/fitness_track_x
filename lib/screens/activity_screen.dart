import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/activity_provider.dart';
import '../widgets/activity_tile.dart';
import 'new_workout_screen.dart';

class ActivityScreen extends StatelessWidget {
  static const routeName = '/activity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activities'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(NewWorkoutScreen.routeName).then((result) {
                if (result != null && result == 'added') {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('New workout added!'),
                    backgroundColor: Colors.green,
                  ));
                }
              });
            },
          ),
        ],
      ),
      body: Consumer<ActivityProvider>(
        builder: (context, activityProvider, child) {
          if (activityProvider.activities.isEmpty) {
            return Center(child: Text('No activities available.'));
          }
          return ListView.builder(
            itemCount: activityProvider.activities.length,
            itemBuilder: (context, index) {
              return ActivityTile(activity: activityProvider.activities[index]);
            },
          );
        },
      ),
    );
  }
}
