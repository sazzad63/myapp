import 'package:flutter/services.dart';

import 'internal/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:myapp/registration/personal_info.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

final _formKey = GlobalKey<FormState>();

String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  final isValidateEmail = emailRegex.hasMatch(email ?? '');
  if (!isValidateEmail) {
    return 'Please type your valid email.';
  }
  return null;
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/images/cover.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    children: [
                      Text(
                        "Login Account",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Enter Mobile Number'),
                    validator: Validators.compose([
                      Validators.required('Mobile number is required'),
                      Validators.minLength(
                          11, 'Enter your 11 character mobile number'),
                      Validators.maxLength(
                          11, 'Enter your 11 character mobile number'),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Enter Password'),
                    validator: Validators.compose([
                      Validators.required('Password is required'),
                      Validators.minLength(
                          6, 'Password minimum 6 characters in length'),
                      Validators.maxLength(
                          8, 'Password maximum 8 characters in length'),
                    ]),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //   print("Success");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard(),
                              maintainState: false),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        elevation: 5,
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(
                    height: 80,
                  ),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("You don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PersonalInfo(),
                                  maintainState: false),
                            );
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
