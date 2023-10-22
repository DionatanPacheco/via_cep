import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:via_cep/model/back4app_model.dart';

class CepRepository {
  Future<CepBack4AppModel> consultarCEP(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return CepBack4AppModel.fromJson(json);
    }
    return CepBack4AppModel([]);
  }
}
