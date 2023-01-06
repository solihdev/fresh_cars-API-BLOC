import 'package:dio/dio.dart';
import 'package:fresh_cars/data/model/cars_model.dart';
import '../model/my_response/my_response.dart';
import 'api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllCars() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/companies");
      if (response.statusCode == 200) {
        myResponse.data = (response.data["data"] as List?)
                ?.map((e) => CarsModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
