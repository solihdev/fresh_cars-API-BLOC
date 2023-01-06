import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_cubit.dart';
import 'package:fresh_cars/bloc/cars/cars_state.dart';
import 'package:fresh_cars/data/api_service/api_service.dart';
import 'package:fresh_cars/data/repositories/cars_repo.dart';

class CarsScreenWithBlockProvider extends StatelessWidget {
  const CarsScreenWithBlockProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarsCubit(
        carsRepo: CarsRepo(apiService: ApiService()),
      )..fetchAllCars(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Cars Screen With Local Provider"),
        ),
        body: BlocBuilder<CarsCubit, CarsState>(
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
              return GridView.builder(
                  itemCount: state.cars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var cars = state.cars[index];
                    return Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Image.network(
                          cars.logo,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    );
                  });
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
