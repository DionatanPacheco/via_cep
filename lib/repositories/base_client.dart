import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl =
    'https://parseapi.back4app.com/classes/MyCustomClassName';

class BaseClient {
  var client = http.Client();

  //GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'X-Parse-Application-Id': 'OUPlF6i3r9xIRJSbqbmh73HGDDbI5yVAA5VBcw3E',
      'X-Parse-REST-API-Key': 'PS5RZcRXf8PvawuBQNnYy20n3ERFTMYhILPfS9Ws',
    };

    var response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'X-Parse-Application-Id': 'OUPlF6i3r9xIRJSbqbmh73HGDDbI5yVAA5VBcw3E',
      'Content-Type': 'application/json',
      'X-Parse-REST-API-Key': 'PS5RZcRXf8PvawuBQNnYy20n3ERFTMYhILPfS9Ws',
    };

    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  ///PUT Request
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseUrl + api);
    var _payload = json.encode(object);
    var _headers = {
      'X-Parse-Application-Id': 'OUPlF6i3r9xIRJSbqbmh73HGDDbI5yVAA5VBcw3E',
      'Content-Type': 'application/json',
      'X-Parse-REST-API-Key': 'PS5RZcRXf8PvawuBQNnYy20n3ERFTMYhILPfS9Ws',
    };

    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }

  Future<dynamic> delete(String api) async {
    var url = Uri.parse(baseUrl + api);
    var _headers = {
      'X-Parse-Application-Id': 'OUPlF6i3r9xIRJSbqbmh73HGDDbI5yVAA5VBcw3E',
      'X-Parse-REST-API-Key': 'PS5RZcRXf8PvawuBQNnYy20n3ERFTMYhILPfS9Ws',
    };

    var response = await client.delete(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      //throw exception and catch it in UI
    }
  }
}
