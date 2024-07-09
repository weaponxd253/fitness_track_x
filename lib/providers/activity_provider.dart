import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityProvider with ChangeNotifier {
  List<Activity> _activities = [];

  List<Activity> get activities => _activities;

  void addActivity(Activity activity) {
    _activities.add(activity);
    notifyListeners();
  }

  void removeActivity(String id) {
    _activities.removeWhere((activity) => activity.id == id);
    notifyListeners();
  }
}
