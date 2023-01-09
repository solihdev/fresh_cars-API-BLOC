import 'package:fresh_cars/data/api_service/api_service.dart';
import 'package:fresh_cars/data/model/my_response/my_response.dart';

class CarsRepo {
  CarsRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getCarsInfo() => apiService.getAllCars();

  Future<MyResponse> getSingleAlbumById(int id) =>
      apiService.getSingleCarById(id);
}
