import 'package:fresh_cars/data/model/cars_model.dart';

abstract class CarsState {}

class InitialCarsState extends CarsState {}

// ------- Fetch All Cars State ------

class LoadCarsInProgress extends CarsState {}

class LoadCarsInSuccess extends CarsState {
  LoadCarsInSuccess({required this.cars});

  final List<CarsModel> cars;
}

class LoadCarsInFailure extends CarsState {
  LoadCarsInFailure({required this.errorText});

  final String errorText;
}

// ------ Fetch single Car State ------

class LoadCarInProgress extends CarsState {}

class LoadCarInSuccess extends CarsState {
  LoadCarInSuccess({required this.car});

  final CarsModel car;
}

class LoadCarInFailure extends CarsState {
  LoadCarInFailure({required this.errorText});

  final String errorText;
}
