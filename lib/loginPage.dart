import 'package:flutter/material.dart';
import 'package:flutter_chat/userController.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _userController = UserController();  // FY FY den her skal væk

  final _formKey = GlobalKey<FormState>();
  var _username = "";
  var _password = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Brugernavn'),
              onSaved: (username) {
                setState(() {
                  _username = username ?? "";
                });
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Kodeord'),
              onSaved: (password) {
                setState(() {
                  _password = password ?? "";
                });
              },
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                final _form = _formKey.currentState;
                _form?.save();
                _userController.login(email: _username, password: _password);
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}


