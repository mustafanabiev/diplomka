import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/plant_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState(plantModel: plants));

  // void toggleFavorite(BuildContext context, int index) {
  //   final updatedPlant = plants[index].copyWith(
  //     isFavorites: !plants[index].isFavorites,
  //   );
  //   plants[index] = updatedPlant;
  //   emit(HomeState(plantModel: List.from(plants)));
  // }
  void toggleFavorite(BuildContext context, PlantModel plant) {
    final plantIndex = plants.indexWhere((p) => p.id == plant.id);
    if (plantIndex != -1) {
      final updatedPlant = plant.copyWith(isFavorites: !plant.isFavorites);
      plants[plantIndex] = updatedPlant;
      emit(HomeState(plantModel: List.from(plants)));
    }
  }
}

List<PlantModel> plants = [
  const PlantModel(
    id: 1,
    image: '1.png',
    name: 'Алма',
    description: '',
    isFavorites: false,
  ),
  const PlantModel(
    id: 2,
    image: '2.jpeg',
    name: 'Алча',
    description: '',
    isFavorites: false,
  ),
  const PlantModel(
    id: 3,
    image: '3.jpeg',
    name: 'Банан',
    description: '',
    isFavorites: false,
  ),
  const PlantModel(
    id: 4,
    image: '4.jpeg',
    name: 'Жүзүм',
    description: '',
    isFavorites: false,
  ),
  const PlantModel(
    id: 5,
    image: '5.jpeg',
    name: 'Картошка',
    description: '',
    isFavorites: false,
  ),
  const PlantModel(
    id: 6,
    image: '6.jpeg',
    name: 'Пияз',
    description: '',
    isFavorites: false,
  ),
  const PlantModel(
    id: 7,
    image: '4.png',
    name: 'Алма',
    description: '',
    isFavorites: false,
  ),
  const PlantModel(
    id: 8,
    image: '6.png',
    name: 'Алма',
    description: '',
    isFavorites: false,
  ),
];
