import 'package:diplomka/models/plant_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState(plantModel: []));

  void addFavorite(PlantModel plant) {
    final plants = List<PlantModel>.from(state.plantModel)..add(plant);
    emit(state.copyWith(plantModel: plants));
  }

  void removeFavorite(PlantModel plant) {
    final plants = List<PlantModel>.from(state.plantModel)..remove(plant);
    emit(state.copyWith(plantModel: plants));
  }
}
