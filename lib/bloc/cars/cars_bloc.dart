import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_event.dart';
import 'package:fresh_cars/bloc/cars/cars_state.dart';
import 'package:fresh_cars/data/model/my_response/my_response.dart';
import 'package:fresh_cars/data/repositories/cars_repo.dart';

class CarsBloc extends Bloc<CarsEvent, CarsState> {
  CarsBloc({required this.carsRepo}) : super(InitialCarsState()) {
    on<FetchAllCars>(_fetchAllCars);
    on<FetchSingleCar>(_fetchSingleCar);
  }

  final CarsRepo carsRepo;

  _fetchAllCars(FetchAllCars event, Emitter<CarsState> emit) async {
    emit(LoadCarsInProgress());

    MyResponse myResponse = await carsRepo.getCarsInfo();

    if (myResponse.error.isEmpty) {
      emit(LoadCarsInSuccess(cars: myResponse.data));
    } else {
      emit(LoadCarsInFailure(errorText: myResponse.error));
    }
  }

  _fetchSingleCar(FetchSingleCar event, Emitter<CarsState> emit) async {
    emit(LoadCarInProgress());
    MyResponse myResponse = await carsRepo.getSingleAlbumById(event.id);

    if (myResponse.error.isEmpty) {
      emit(LoadCarInSuccess(car: myResponse.data));
    } else {
      emit(LoadCarInFailure(errorText: myResponse.error));
    }
  }
}
