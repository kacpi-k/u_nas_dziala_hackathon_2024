import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/assets/app_images.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';

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
          SizedBox(
            height: 20,
          ),
          _emailField(context),
          _passwordField(context),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Zaloguj',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Nie masz konta? '),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Załóż je tutaj!',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 80, right: 80, bottom: 20),
      child: TextField(
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        controller: _email,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Email',
            fillColor: AppColors.secondBackground,
            hintStyle: TextStyle(color: Colors.black38)),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 80, right: 80, bottom: 20),
        child: TextField(
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black),
          controller: _password,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            
            hintStyle: TextStyle(color: Colors.black38),
            hintText: 'Haslo',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              
                icon: Icon(
                  color: Colors.black,
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
