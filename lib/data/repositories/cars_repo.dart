import 'package:fresh_cars/data/api_service/api_service.dart';
import 'package:fresh_cars/data/model/my_response/my_response.dart';

class CarsRepo {
  CarsRepo({required ApiService apiService}) {
    _apiService = apiService;
  }

  late ApiService _apiService;

  Future<MyResponse> getCarsInfo() =>_apiService.getAllCars();
}
