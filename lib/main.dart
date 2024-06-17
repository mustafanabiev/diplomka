import 'package:diplomka/create/cubit/create_cubit.dart';
import 'package:diplomka/favorites/cubit/favorites_cubit.dart';
import 'package:diplomka/home/cubit/home_cubit.dart';
import 'package:diplomka/main/cubit/main_cubit.dart';
import 'package:diplomka/main/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(seedColor: Colors.green);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => CreateCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: colorScheme,
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
