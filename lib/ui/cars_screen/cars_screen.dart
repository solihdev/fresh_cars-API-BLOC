import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_cubit.dart';
import 'package:fresh_cars/bloc/cars/cars_state.dart';
import 'package:fresh_cars/utils/my_utils.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cars Screen"),
      ),
      body: BlocConsumer<CarsCubit, CarsState>(
        builder: (context, state) {
          if (state is InitialCarsState) {
            return const Center(
              child: Text("Hali data yo"),
            );
          } else if (state is LoadCarsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadCarsInSuccess) {
            return ListView(
              children: List.generate(
                  state.cars.length,
                  (index) => ListTile(
                        title: Text(state.cars[index].carModel),
                      )),
            );
          }
          return const SizedBox();
        },
        listener: (context, state) {
          if (state is LoadCarsInSuccess) {
            MyUtils.getMyToast(message: state.cars.length.toString());
          }
        },
      ),
    );
  }
}
