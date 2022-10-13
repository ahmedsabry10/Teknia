import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknia/Data/Cubits/LoginCubit/login_cubit.dart';
import 'package:teknia/Data/Cubits/LoginCubit/login_states.dart';
import 'package:teknia/Data/Shared/Components/reusable_components.dart';
import 'package:teknia/Data/Shared/Styles/icon_broken.dart';
import 'package:teknia/Screens/AuthScreens/Register/register_screen.dart';
import 'package:teknia/Screens/HomeScreens/home_screen.dart';


// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: NetworkImage(
                                    'https://icones.pro/wp-content/uploads/2021/04/logo-spotify-icone-png-violet.png')),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        //email

                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          enabled: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                18.0, 10.0, 18.0, 10.0),
                            labelText: 'Email Address',
                            labelStyle:
                                const TextStyle(fontStyle: FontStyle.italic),
                            prefixIcon: const Icon(
                              IconBroken.Message,
                              color: Colors.deepPurple,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.deepPurple,
                                width: .5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.deepPurple,
                                width: .5,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        //password
                        TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: LoginCubit.get(context).isPassword,
                          enabled: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your password";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                18.0, 10.0, 18.0, 10.0),
                            labelText: 'Password',
                            labelStyle:
                                const TextStyle(fontStyle: FontStyle.italic),
                            prefixIcon: const Icon(
                              IconBroken.Lock,
                              color: Colors.deepPurple,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.deepPurple,
                                width: .5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(
                                color: Colors.deepPurple,
                                width: .5,
                              ),
                            ),
                            suffixIcon:
                                // ignore: unnecessary_null_comparison
                                LoginCubit.get(context).suffix != null
                                    ? IconButton(
                                        icon: Icon(
                                            LoginCubit.get(context).suffix),
                                        color: Colors.deepPurple,
                                        onPressed: () {
                                          LoginCubit.get(context)
                                              .changePasswordVisibility();
                                        },
                                      )
                                    : null,
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => Container(
                            width: double.infinity,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                              color: Colors.deepPurple,
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  navigateAndFinish(
                                      context,  HomeScreen());
                                } else {
                                  // ignore: avoid_print
                                  print('NUll');
                                }
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateAndFinish(
                                    context, const RegisterScreen());
                              },
                              child: Text(
                                'Sign up'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.deepPurple,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
