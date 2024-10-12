import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _passwordConfirmation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _loginText(context),
          SizedBox(height: 20,),
          _emailField(context,),
          _passwordField(context),
          _passwordConfirmationField(context)
          
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
            hintText: 'Hasło',
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

  Widget _passwordConfirmationField(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 80, right: 80, bottom: 20),
        child: TextField(
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black),
          controller: _passwordConfirmation,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            
            hintStyle: TextStyle(color: Colors.black38),
            hintText: 'Potwierdź hasło',
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
      'Załóż konto!',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}