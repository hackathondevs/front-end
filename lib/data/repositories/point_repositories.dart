import 'package:dio/dio.dart';
import 'package:zooventure/data/datasources/local/local_storage.dart';
import 'package:zooventure/data/datasources/remote/api.dart';

class PointRepository {
  final Dio _dio = Dio();

  Future<String?> _init() async {
    String? token = await LocalStorage.getUserToken();
    return token;
  }

  Future<bool> changePoint(int amount, String code) async {
    String? userToken = await _init();
    try {
      final response = await _dio.post(
        Api.getUserMoneyChangerEndpoint(),
        data: {'amount': amount, 'code': code},
        options: Options(headers: {'Authorization': 'Bearer $userToken'}),
      );

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      throw Exception("Error di point repo: $e");
    }
    return false;
  }
}
