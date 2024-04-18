import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  final String userName = 'dlss';
  final String userEmail = 'sdsa';
  //final Function() onLogout;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('URL_DE_LA_IMAGEN_DE_PERFIL'),
              // Aquí puedes proporcionar la URL de la imagen de perfil
            ),
            SizedBox(height: 20),
            Text(
              'Nombre de usuario: $userName',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Correo electrónico: $userEmail',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: null,
              //onPressed: onLogout,
              child: Text('Cerrar sesión'),
            ),
          ],
        ),
      );
  }
}