import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_images.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _loginText(context),
          SizedBox(height: 20,),
          _emailField(context),
          _passwordField(context),
          ElevatedButton(onPressed: () {}, child: Text('Zaloguj'))
        ],
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 100, right: 100, bottom: 20),
      child: TextField(
        
        controller: _email,
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: 'Email'),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 100, right: 100, bottom: 20),
        child: TextField(
          controller: _password,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            hintText: 'Haslo',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                }),
          ),
        ));
  }

  Widget _loginText(BuildContext context) {
    return Text(
      'Zaloguj sie!',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}
