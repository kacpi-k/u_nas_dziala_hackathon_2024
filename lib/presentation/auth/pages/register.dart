import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/button/button_state.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/button/button_state_cubit.dart';
import 'package:u_nas_dziala_hackathon_2024/common/helper/navigator/app_navigator.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/button/basic_reactive_button.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_creation_req.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/usecases/signup.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/auth/pages/login.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/pages/home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ButtonStateCubit>(
      create: (context) => ButtonStateCubit(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(
                  context,
                  const HomePage(),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _signupText(context),
                  const SizedBox(height: 20),
                  _firstNameField(context),
                  const SizedBox(height: 10),
                  _lastNameField(context),
                  const SizedBox(height: 10),
                  _emailField(context),
                  const SizedBox(height: 10),
                  _passwordField(context),
                  const SizedBox(height: 25),
                  _continueButton(
                      context), // Tutaj korzystasz z ButtonStateCubit
                  const SizedBox(height: 35),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Masz ju konto? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlocProvider<ButtonStateCubit>(
                                create: (context) => ButtonStateCubit(),
                                child: const LoginPage(),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'Zaloguj się!',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return const Text(
      'Rejestracja',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _firstNameField(BuildContext context) {
    return Card(
      child: TextField(
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        controller: _firstNameController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Imię',
            fillColor: AppColors.secondBackground,
            hintStyle: TextStyle(color: Colors.black54)),
      ),
    );
  }

  Widget _lastNameField(BuildContext context) {
    return Card(
      child: TextField(
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        controller: _lastNameController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Nazwisko',
            fillColor: AppColors.secondBackground,
            hintStyle: TextStyle(color: Colors.black54)),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return Card(
      child: TextField(
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        controller: _emailController,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Email',
            fillColor: AppColors.secondBackground,
            hintStyle: TextStyle(color: Colors.black54)),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Card(
      child: TextField(
        cursorColor: Colors.black,
        style: const TextStyle(
          color: Colors.black,
        ),
        controller: _passwordController,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: Colors.black54,
          ),
          hintText: 'Hasło',
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              color: Colors.black,
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(
                () {
                  _isPasswordVisible = !_isPasswordVisible;
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicReactiveButton(
      onPressed: () {
        UserCreationReq req = UserCreationReq(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );
        context.read<ButtonStateCubit>().execute(
              usecase: SignupUseCase(),
              params: req,
            );
      },
      title: 'Zarejestruj',
    );
  }
}
