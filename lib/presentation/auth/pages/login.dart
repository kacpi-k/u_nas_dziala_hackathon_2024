import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/button/button_state.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/button/button_state_cubit.dart';
import 'package:u_nas_dziala_hackathon_2024/common/helper/navigator/app_navigator.dart';
import 'package:u_nas_dziala_hackathon_2024/common/widgets/button/basic_reactive_button.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';
import 'package:u_nas_dziala_hackathon_2024/data/auth/models/user_sigin_req.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/auth/usecases/singin.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/auth/pages/register.dart';
import 'package:u_nas_dziala_hackathon_2024/presentation/home/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
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
                _loginText(context),
                const SizedBox(height: 20),
                _emailField(context),
                const SizedBox(height: 10),
                _passwordField(context),
                const SizedBox(height: 25),
                _signinButton(context),
                const SizedBox(height: 35),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Nie masz konta? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                BlocProvider<ButtonStateCubit>(
                              create: (context) => ButtonStateCubit(),
                              child: const RegisterPage(),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'Załóż je tutaj!',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
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

  Widget _loginText(BuildContext context) {
    return const Text(
      'Logowanie',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _signinButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          UserSigninReq req = UserSigninReq(
            email: _emailController.text,
            password: _passwordController.text,
          );
          context.read<ButtonStateCubit>().execute(
                usecase: SigninUseCase(),
                params: req,
              );
        },
        title: 'Zaloguj',
      );
    });
  }
}
