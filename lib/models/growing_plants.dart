class GrowingPlants {
  const GrowingPlants({
    required this.name,
    required this.date,
    required this.time,
    required this.comment,
    this.tizmeModel,
  });

  final String name;
  final String date;
  final String time;
  final String comment;
  final List<TizmeModel>? tizmeModel;

  GrowingPlants copyWith({
    String? name,
    String? date,
    String? time,
    String? comment,
    List<TizmeModel>? tizmeModel,
  }) {
    return GrowingPlants(
      name: name ?? this.name,
      date: date ?? this.date,
      time: time ?? this.time,
      comment: comment ?? this.comment,
      tizmeModel: tizmeModel ?? this.tizmeModel,
    );
  }
}

class TizmeModel {
  TizmeModel({
    required this.nameJob,
    required this.isActive,
  });

  final String nameJob;
  bool isActive;
}
