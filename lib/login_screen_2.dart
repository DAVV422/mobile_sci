import 'dart:convert';

import 'package:emergyai/environments/environments.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen2 extends StatelessWidget {
  final Color? backgroundColor1;
  final Color? backgroundColor2;
  final Color? highlightColor;
  final Color? foregroundColor;
  final AssetImage? logo;

  LoginScreen2({
    Key? k,
    this.backgroundColor1 = const Color(0xFF444152),
    this.backgroundColor2 = const Color(0xFF6f6c7d),
    this.highlightColor = const Color(0xFF03159c),
    this.foregroundColor = Colors.white,
    this.logo = const AssetImage("assets/images/full-bloom.png"),
  });

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    print(username);
    print(password);

    // Envía los datos a la API
    try {
      var response = await http.post(
        Uri.parse('${Environment.apiUrl}/login'),
        body: {
          'email': username,
          'password': password,
        },
      );
      print(response.body);
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      var statusCode = responseJson['statusCode'];
      print(statusCode);

      // Maneja la respuesta de la API según sea necesario
      if (statusCode == 200) {
        // El inicio de sesión fue exitoso
        print('Inicio de sesión exitoso');
        print(responseJson['data']);
      } else {
        // El inicio de sesión falló
        print('Inicio de sesión fallido: ${responseJson['message']}');
      }
    } catch (e) {
      // Maneja errores de conexión u otros errores
      print('Error de conexión: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
              colors: [backgroundColor1!, backgroundColor2!], // whitish to gray
              tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 110.0, bottom: 50.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 128.0,
                        width: 128.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: foregroundColor!,
                            width: 1.0,
                          ),
                          shape: BoxShape.circle,
                          //image: DecorationImage(image: this.logo)
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundColor: foregroundColor,
                          radius: 100.0,
                          child: Text(
                            "SCI",
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "EmergyAI",
                          style: TextStyle(color: foregroundColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: foregroundColor!, width: 0.5, style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                      child: Icon(
                        Icons.alternate_email,
                        color: foregroundColor,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _usernameController,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: foregroundColor),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'example@live.com',
                          hintStyle: TextStyle(color: foregroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: foregroundColor!, width: 0.5, style: BorderStyle.solid),
                  ),
                ),
                padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                      child: Icon(
                        Icons.lock_open,
                        color: foregroundColor,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: foregroundColor),
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: foregroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                        color: highlightColor,
                        onPressed: () => _login(),
                        child: Text(
                          "Log In",
                          style: TextStyle(color: foregroundColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                        color: Colors.transparent,
                        onPressed: () => {},
                        child: Text(
                          "Forgot your password?",
                          style: TextStyle(color: foregroundColor!.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: Divider(),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
              //   alignment: Alignment.center,
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //         child: MaterialButton(
              //           padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              //           color: Colors.transparent,
              //           onPressed: () => {},
              //           child: Text(
              //             "Don't have an account? Create One",
              //             style: TextStyle(color: foregroundColor!.withOpacity(0.5)),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
