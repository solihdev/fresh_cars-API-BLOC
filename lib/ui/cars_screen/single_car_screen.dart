import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_state.dart';
import 'package:fresh_cars/data/repositories/cars_repo.dart';
import '../../bloc/cars/cars_event.dart';

class SingleCarScreen extends StatelessWidget {
  const SingleCarScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CarsBloc>(
      create: (context) => CarsBloc(carsRepo: context.read<CarsRepo>())
        ..add(
          FetchSingleCar(id: id),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Info Screen"),
        ),
        body: BlocBuilder<CarsBloc, CarsState>(
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
                  Image.network(state.car.logo),
                  Row(
                    children: [
                      Text("Average price: ${state.car.averagePrice}"),
                      Text("Estableshed Year: ${state.car.estableshedYear}"),
                    ],
                  )
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
