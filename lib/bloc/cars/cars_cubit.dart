import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_cars/bloc/cars/cars_state.dart';
import 'package:fresh_cars/data/model/my_response/my_response.dart';
import 'package:fresh_cars/data/repositories/cars_repo.dart';

class CarsCubit extends Cubit<CarsState> {
  CarsCubit({required this.carsRepo}) : super(InitialCarsState());

  final CarsRepo carsRepo;

  fetchAllCars() async {
    emit(LoadCarsInProgress());

    MyResponse myResponse = await carsRepo.getCarsInfo();

    if (myResponse.error.isEmpty) {
      emit(LoadCarsInSuccess(cars: myResponse.data));
    } else {
      emit(LoadCarsInFailure(errorText: myResponse.error));
    }
  }

  fetchSingleCar(int id) async {
    emit(LoadCarInProgress());

    MyResponse myResponse = await carsRepo.getSingleAlbumById(id);

    if (myResponse.error.isEmpty) {
      emit(LoadCarInSuccess(car: myResponse.data));
    } else {
      emit(LoadCarInFailure(errorText: myResponse.error));
    }
  }
}
