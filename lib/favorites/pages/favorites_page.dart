import 'package:diplomka/home/cubit/home_cubit.dart';
import 'package:diplomka/home/pages/home_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(seedColor: Colors.green);
    return Scaffold(
      backgroundColor: colorScheme.onInverseSurface,
      appBar: AppBar(
        backgroundColor: colorScheme.onInverseSurface,
        surfaceTintColor: colorScheme.onInverseSurface,
        title: const Text('Тандалган өсүмдүктөр'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final favoritePlants = state.plantModel
                .where((plant) => plant.isFavorites == true)
                .toList();

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              padding: const EdgeInsets.all(8.0),
              itemCount: favoritePlants.length,
              itemBuilder: (context, index) {
                final plant = favoritePlants[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetailPage(
                          index: index,
                          plantModel: plant,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset(
                                'assets/images/${plant.image}',
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Text(
                            plant.name,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
