import 'dart:convert';

import 'package:emergyai/components/errorSnackbar.dart';
import 'package:emergyai/models/auth.dart';
import 'package:emergyai/models/user.dart';
import 'package:emergyai/services/auth_service.dart';
import 'package:emergyai/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../environments/environments.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color? backgroundColor1 = const Color(0xFF444152);
  final Color? backgroundColor2 = const Color(0xFF6f6c7d);
  final Color? highlightColor = const Color(0xFF03159c);
  final Color? foregroundColor = Colors.white;
  final AssetImage? logo = const AssetImage("assets/images/full-bloom.png");


  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _Login() async {
    try{
      print("desde el metodo login");
      Auth userAuth = await login(_usernameController.text, _passwordController.text);
      _saveAndRedirectToHome(userAuth);
    }catch (e){
      errorSnackBar(context, e.toString());
    }
    
  }

void _saveAndRedirectToHome(Auth userAuth) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    User user = userAuth.user;
    await pref.setString('token', userAuth.token );
    await pref.setString('userId', user.id );
    Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false);

  } 


 Future<void> _Login2() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    print(username);
    print(password);

    // Envía los datos a la API
    try {
      var response = await http.post(
        Uri.parse('${Environment.apiUrl}/LoginScreen'),
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
                          onPressed: () {
                                
                                  setState(() {
                                    print("Desde EL boton");
                                    _Login();
                                  });
                              },
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
                
              ],
            ),
          ),
        ),
      );
    }

}