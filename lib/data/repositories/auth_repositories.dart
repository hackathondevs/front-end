import 'package:dio/dio.dart';
import 'package:zooventure/data/datasources/local/local_storage.dart';
import 'package:zooventure/data/datasources/remote/api.dart';
import 'package:zooventure/data/models/user.dart';

class AuthRepository {
  final Dio _dio = Dio();
  List<User> listUserModel = [];

  Future<bool> signupRepository(String name, String email, String password,
      String passwordConfirmation) async {
    try {
      final response = await _dio.post(Api.getSignupEndpoint(), data: {
        "name": name,
        "email": email,
        "password": password,
        "passwordConfirmation": passwordConfirmation
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        print("kode selain 201: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error at signup repository ${e.toString()}");
    }
    print("error di auth repo signup");
    return false;
  }

  Future<bool> loginRepository(
    String email,
    String password,
    bool remember,
  ) async {
    try {
      final response = await _dio.post(Api.getLoginEndpoint(),
          data: {"email": email, "password": password, "rememberMe": remember});

      if (response.statusCode == 200) {
        final token = response.data["token"];
        LocalStorage.addUserToken(token);
        print("ini login");
        print(response.data);
        return true;
      }
    } catch (e) {
      throw Exception("Error at login repository ${e.toString()}");
    }
    return false;
  }

  Future<List<User>?> getUserDataRepository() async {
    try {
      var response = await _dio.get(Api.getUserDataEndpoint());

      if (response.statusCode == 200) {
        for (var data in (response.data as List<dynamic>)) {
          User userModel = User.fromJson(data);
          listUserModel.add(userModel);
        }
      }
      print(listUserModel);
      return listUserModel;
    } catch (e) {
      throw Exception('ada error di getUserData ${e.toString()}');
    }
  }
}
