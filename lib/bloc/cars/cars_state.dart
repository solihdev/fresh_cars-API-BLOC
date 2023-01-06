import 'package:fresh_cars/data/model/cars_model.dart';

abstract class CarsState {}

class InitialCarsState extends CarsState {}

class LoadCarsInProgress extends CarsState {}

class LoadCarsInSuccess extends CarsState {
  LoadCarsInSuccess({required this.cars});

  final List<CarsModel> cars;
}

class LoadCarsInFailure extends CarsState {
  LoadCarsInFailure({required this.errorText});

  final String errorText;
}
