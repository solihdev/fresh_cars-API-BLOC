import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_cubit.dart';
import 'package:fresh_cars/bloc/cars/cars_state.dart';

class SingleCarScreen extends StatelessWidget {
  const SingleCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deateiled text"),
      ),
      body:  BlocBuilder<CarsCubit,CarsState>(builder: (context,state){
        if (state is InitialCarsState) {
          return const Center(
            child: Text("Hali data yo"),
          );
        }
        else if (state is LoadCarInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is LoadCarInSuccess) {
          return Column(
            children: [
              Text(state.car.id.toString()),
            ],
          );
        }
        return const SizedBox();
      },),
    );
  }
}
