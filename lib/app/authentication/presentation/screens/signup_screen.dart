import 'package:alex_messenger/app/authentication/domain/entities/account.dart';
import 'package:alex_messenger/app/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:alex_messenger/app/authentication/presentation/screens/login_screen.dart';
import 'package:alex_messenger/config/app_colors.dart';
import 'package:alex_messenger/config/app_paths.dart';
import 'package:alex_messenger/core/services/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/authentication_button.dart';
import 'widgets/input_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, authState) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    gradient: AppGradients.primary
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Create account',
                          style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.headline3!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        ),
                        Text('to get started now',
                          style: GoogleFonts.lato(
                              textStyle: Theme.of(context).textTheme.headline4!.copyWith(
                                color: Colors.white70,
                              )
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        InputText(title: AutofillHints.email, controller: emailController),
                        const SizedBox(height: 12.0),
                        InputText(title: AutofillHints.password, isObscure: true, controller: passwordController),
                        const SizedBox(height: 12.0),
                        InputText(title: 'Re-password', isObscure: true, controller: rePasswordController),
                        Row(
                          children: [
                            const Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Text('Forgot password?',
                                    style: GoogleFonts.lato(
                                        color: Colors.white
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AuthenticationButton(
                            onTap: () {
                              _signup(
                                  emailController.value.text,
                                  passwordController.value.text,
                                  rePasswordController.value.text
                              );
                            },
                            child: Text('Signup',
                              style: GoogleFonts.lato(
                                  textStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.1),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(child: Container(height: 1.0, color: Colors.white)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text('Or login with',
                                style: GoogleFonts.lato(
                                    color: Colors.white
                                ),
                              ),
                            ),
                            Expanded(child: Container(height: 1.0, color: Colors.white))
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          children: [
                            Expanded(child: AuthenticationButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(AppPath.google),
                                )
                            )),
                            const SizedBox(width: 12.0),
                            Expanded(child: AuthenticationButton(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Image.asset(AppPath.facebook),
                                )
                            )),
                          ],
                        ),
                        SizedBox(height: size.height * 0.15),
                        RichText(
                          text: TextSpan(
                              style: GoogleFonts.lato(),
                              children: [
                                const TextSpan(
                                    text: 'Had an account?'
                                ),
                                const WidgetSpan(child: SizedBox(width: 4.0)),
                                WidgetSpan(
                                    child: GestureDetector(
                                      onTap: () {
                                        _pushLoginScreen();
                                      },
                                      child: Text('Login now',
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                        ),
                                      ),
                                    )
                                )
                              ]
                          ),
                        ),
                        const SizedBox(height: 32.0)
                      ],
                    ),
                  ),
                ),
              ),
              if(authState is AuthenticationStateLoading)
                Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  color: Colors.white60,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        );
      },
);
  }

  void _pushLoginScreen() {
    AppRouter.pushReplacement(const LoginScreen());
  }

  void _signup(String email, String password, String rePassword) {
    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationEventSignup(
      account: Account(
        email: email,
        password: password,
        rePassword: rePassword
      )
    ));
  }
}


