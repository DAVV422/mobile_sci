import 'dart:convert';

import 'package:emergyai/models/auth.dart';
import 'package:emergyai/services/endpoints.dart';
import 'package:http/http.dart' as http;


  Future<Auth> login(String email, String password) async{
    Auth auth;
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);

    http.Response response = await http.post(
      Uri.parse(authLogin),
      headers: headers,
      body: body,
    );

    int statusCode = jsonDecode(response.body)['statusCode'];
    switch(statusCode){
      case 200:
        auth = Auth.fromJson(jsonDecode(response.body)['data']);
        break;
      default:
        throw Exception('Usuario o contraseña inválidos');
    }
    
    return auth;
  }

