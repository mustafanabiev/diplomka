import 'package:diplomka/home/cubit/home_cubit.dart';
import 'package:diplomka/models/plant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({
    super.key,
    required this.plantModel,
    required this.index,
  });

  final PlantModel plantModel;
  final int index;

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.plantModel.name),
        centerTitle: true,
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context
                      .read<HomeCubit>()
                      .toggleFavorite(context, widget.plantModel);
                },
                icon: state.plantModel[widget.index].isFavorites
                    ? const Icon(
                        Icons.star,
                        color: Colors.amber,
                      )
                    : const Icon(
                        Icons.star_outline,
                        color: Colors.amber,
                      ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    'assets/images/${widget.plantModel.image}',
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                  child: Text(
                '${widget.plantModel.name}${widget.plantModel.text} өстүрүү',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )),
              const SizedBox(height: 10),
              SizedBox(
                child: Text(
                  widget.plantModel.description,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
