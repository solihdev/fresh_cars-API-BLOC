import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_cubit.dart';
import 'package:fresh_cars/bloc/cars/cars_state.dart';
import 'package:fresh_cars/data/api_service/api_service.dart';
import 'package:fresh_cars/data/repositories/cars_repo.dart';

class SingleCarScreen extends StatelessWidget {
  const SingleCarScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CarsCubit>(
      create: (context) =>
          CarsCubit(carsRepo: CarsRepo(apiService: ApiService()))
            ..fetchSingleCar(id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Delineated text"),
        ),
        body: BlocBuilder<CarsCubit, CarsState>(
          builder: (context, state) {
            if (state is InitialCarsState) {
              return const Center(
                child: Text("Hali data yo"),
              );
            } else if (state is LoadCarInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadCarInSuccess) {
              return Column(
                children: [
                  Text(state.car.id.toString()),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
