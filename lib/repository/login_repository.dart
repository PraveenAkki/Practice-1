import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginRepository {

  Future<String> loginApi({required String email, required String password}) async {
    try{
      Map<String, String> loginCred = {'email': email, 'password': password};

      final response = await http.post(Uri.parse('https://reqres.in/api/login'),
          body: loginCred
      );

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data['token'].toString();
      } else {
        throw Exception(data['error']?.toString() ?? 'Login failed');
      }

    } on Exception catch (e, stacktrace){
      rethrow;
    }
  }

}