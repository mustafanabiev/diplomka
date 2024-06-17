part of 'home_cubit.dart';

class HomeState {
  HomeState({
    required this.plantModel,
    this.plant,
  });
  final List<PlantModel> plantModel;
  final PlantModel? plant;

  HomeState copyWith({
    List<PlantModel>? plantModel,
    PlantModel? plant,
  }) {
    return HomeState(
      plantModel: plantModel ?? this.plantModel,
      plant: plant ?? this.plant,
    );
  }
}
