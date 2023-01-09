abstract class CarsEvent {}

class FetchAllCars extends CarsEvent {}

class FetchSingleCar extends CarsEvent {
  FetchSingleCar({required this.id});

  final int id;
}
