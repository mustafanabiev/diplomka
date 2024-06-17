part of 'favorites_cubit.dart';

class FavoritesState {
  FavoritesState({required this.plantModel});
  final List<PlantModel> plantModel;

  FavoritesState copyWith({
    List<PlantModel>? plantModel,
  }) {
    return FavoritesState(
      plantModel: plantModel ?? this.plantModel,
    );
  }
}
