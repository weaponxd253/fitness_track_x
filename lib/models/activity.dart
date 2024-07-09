class Activity {
  final String id;
  final String name;
  final int value;
  final int duration; // Duration in minutes
  final DateTime date;
  final String type; // e.g., 'Cardio', 'Strength'

  Activity({
    required this.id,
    required this.name,
    required this.value,
    required this.duration,
    required this.date,
    required this.type,
  });
}
