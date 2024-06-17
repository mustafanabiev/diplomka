import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/growing_plants.dart';

part 'create_state.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(const CreateState(growingPlants: []));

  void saveDate(TypeDateTime type, String data) {
    if (TypeDateTime.date == type) {
      emit(state.copyWith(date: data));
    } else {
      emit(state.copyWith(time: data));
    }
  }

  void addPlants(GrowingPlants growingPlants) {
    final plants = List<GrowingPlants>.from(state.growingPlants)
      ..add(growingPlants);
    emit(state.copyWith(growingPlants: plants));
  }

  void removePlants(GrowingPlants growingPlants) {
    final plants = List<GrowingPlants>.from(state.growingPlants)
      ..remove(growingPlants);
    emit(state.copyWith(growingPlants: plants));
  }
}

enum TypeDateTime { date, time }
