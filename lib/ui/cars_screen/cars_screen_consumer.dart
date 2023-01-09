import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_state.dart';
import 'package:fresh_cars/ui/cars_screen/single_car_screen.dart';
import 'package:fresh_cars/utils/my_utils.dart';

class CarsScreenWithConsumer extends StatelessWidget {
  const CarsScreenWithConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Cars Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocConsumer<CarsBloc, CarsState>(
        builder: (context, state) {
          if (state is InitialCarsState) {
            return const Center(
              child: Text("Hali data yo"),
            );
          }
          else if (state is LoadCarsInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is LoadCarsInSuccess) {
            return GridView.builder(
                itemCount: state.cars.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  var cars = state.cars[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleCarScreen(id: state.cars[index].id)));
                    },
                    child: Container(
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
                    ),
                  );
                });
          }
          return const SizedBox();
        },
        buildWhen: (oldState,newState){
          return newState is LoadCarsInSuccess;
        },
        listener: (context, state) {
          if (state is LoadCarsInProgress) {
            MyUtils.getMyToast(message: "Loading in progress...");
          }
        },
        listenWhen: (oldState,newState){
          return newState is LoadCarsInProgress;
        },
      ),
    );
  }
}
