part of 'create_cubit.dart';

class CreateState {
  const CreateState({
    this.date,
    this.time,
    required this.growingPlants,
  });

  final String? date;
  final String? time;
  final List<GrowingPlants> growingPlants;

  CreateState copyWith({
    String? date,
    String? time,
    List<GrowingPlants>? growingPlants,
  }) {
    return CreateState(
      date: date ?? this.date,
      time: time ?? this.time,
      growingPlants: growingPlants ?? this.growingPlants,
    );
  }
}
