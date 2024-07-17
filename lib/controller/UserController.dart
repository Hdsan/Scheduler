import 'dart:convert';
import 'package:http/http.dart' as http;

class UserController {

  Future<bool> tryLogin(String valorCampo1, String valorCampo2) async {
    Map<String, String> dados = {
      'campo1': valorCampo1,
      'campo2': valorCampo2,
    };

    try {
      var response = await http.post(
        Uri.parse('http://192.168.100.196:3000/login'),
        body: dados,
      );
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (jsonResponse['login']) {
        print(jsonResponse);
        return true;
      } else {
        print('Erro na requisição: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Erro ao enviar requisição: $e');
      return false;
    }
  }
}