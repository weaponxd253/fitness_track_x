import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_track_x/providers/activity_provider.dart';
import 'package:fitness_track_x/models/activity.dart';

void main() {
  group('ActivityProvider', () {
    test('should add activity', () {
      final provider = ActivityProvider();
      final activity = Activity(id: '1', name: 'Running', value: 5);

      provider.addActivity(activity);

      expect(provider.activities.contains(activity), true);
    });

    test('should remove activity by id', () {
      final provider = ActivityProvider();
      final activity1 = Activity(id: '1', name: 'Running', value: 5);
      final activity2 = Activity(id: '2', name: 'Swimming', value: 3);

      provider.addActivity(activity1);
      provider.addActivity(activity2);

      provider.removeActivity('1');

      expect(provider.activities.contains(activity1), false);
      expect(provider.activities.contains(activity2), true);
    });
  });
}
