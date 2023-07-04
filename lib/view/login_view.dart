import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_elisoft_task/components/custom_password_field.dart';
import 'package:flutter_elisoft_task/components/custom_text_field.dart';
import 'package:flutter_elisoft_task/constant/color.dart';
import 'package:flutter_elisoft_task/cubit/auth_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'My APPS',
                style: TextStyle(
                  color: greenTertiaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/bg_image.jpg'),
                  height: 320,
                ),
              ),
              // username textfield
              CustomTextField(
                controller: usernameController,
                label: 'Username',
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please Enter Your Email");
                  }
                  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      .hasMatch(value)) {
                    return ("Please Enter a valid email");
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),
              // password textfield
              CustomPasswordField(
                passwordController: passwordController,
                passwordVisible: passwordVisible,
                validator: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                  if (value!.isEmpty) {
                    return ("Password is required for login");
                  }
                  if (!regex.hasMatch(value)) {
                    return ("Enter Valid Password(Min. 6 Character)");
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              // login button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: greenTertiaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).postLogin(
                        usernameController.text,
                        passwordController.text,
                      );
                    }
                  },
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const CircularProgressIndicator();
                      }

                      if (state is AuthFilled) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushNamed(
                            context,
                            '/article-view',
                          );
                        });
                      }

                      return const Text(
                        'LOGIN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
