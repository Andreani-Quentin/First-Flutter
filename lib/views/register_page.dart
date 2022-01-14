import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController tecUsername = new TextEditingController();
  TextEditingController tecEmail = new TextEditingController();
  TextEditingController tecPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("Enregistrement")
        ),
        body: _buildColumnFields()
    );
  }

  Widget _buildColumnFields() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(),
          TextField(
            controller: tecUsername,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                label: Text('Nom d\'utilisateur'),
                prefixIcon: Icon(Icons.person)
            ),),
          TextField(
            controller: tecEmail,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
                label: Text('e-mail'),
                prefixIcon: Icon(Icons.email)
            ),),
          TextField(
            controller: tecPassword,
            textInputAction: TextInputAction.done,
            obscureText: true,
            decoration: const InputDecoration(
                label: Text('Mot de passe'),
                prefixIcon: Icon(Icons.password)
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: _onRegister,
            child: const Text("S'ENREGISTRER"),
          ),
          ElevatedButton(
            onPressed: _onLoginPage,
            child: const Text("DÉJA UN COMPTE ? : S'IDENTIFIER"),
          )
        ],
      ),
    );
  }

  _onRegister() async {
    print('username : $tecUsername');
    print('email : $tecEmail');
    print('password : $tecPassword');

    String userName = tecUsername.text;
    String email = tecEmail.text;
    String password = tecPassword.text;

    // flutter pub add http

    try {
      var responseRegister = await http.post(
          Uri.parse("https://flutter-learning.mooo.com/auth/local/register"),
          body: {
            "username": userName,
            "email": email,
            "password": password,
          }
      );
      if(responseRegister.statusCode == 200) {
        // Gérer succes
        SnackBar snackBarSuccess = const SnackBar(content: Text("Connexion réussie"));
        ScaffoldMessenger.of(context).showSnackBar(snackBarSuccess);
        // Supprimer le contenue de nos TextField
        tecUsername.clear();
        tecEmail.clear();
        tecPassword.clear();
      } else if (responseRegister.statusCode > 0) {
        // Si le serveur répond autre chose que 200 alors il affiche l'erreur du serveur
        SnackBar snackBarFailure = SnackBar(content: Text("Erreur : " + responseRegister.statusCode.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
      }
    }on SocketException catch (socketException) {
      // On affiche un message lorsque le serveur est inatteignable (erreur de connexion)
      SnackBar snackBarFailure = const SnackBar(content: Text("Nous avons des difficultés à joindre le serveur"));
      ScaffoldMessenger.of(context).showSnackBar(snackBarFailure);
    }
  }

  _onLoginPage() {
    Navigator.of(context).pushNamed('/login');
  }
}