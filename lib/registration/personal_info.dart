import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../main.dart';
import 'academic_info.dart';

final _formKey = GlobalKey<FormState>();

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
              const SizedBox(height: 50,),
                Image.asset(
                  "assets/images/cover.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 50,),
                const Text(
                  "Create New Account",
                  style: TextStyle(
                    fontSize: 22
                  ),
                ),
                const SizedBox(height: 5,),
                const Text("(Step 1 of 3)"),
                const SizedBox(height: 30,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: 'Enter your Name'
                  ),
                  validator: Validators.compose([
                    Validators.required('Enter your name'),
                  ]),
                ),
                const SizedBox(height: 20,),

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: 'Enter Mobile Number'
                  ),
                  validator: Validators.compose([
                    Validators.required('Enter your mobile number'),
                    Validators.minLength(
                        11, 'Enter your 11 character mobile number'),
                    Validators.maxLength(
                        11, 'Enter your 11 character mobile number'),
                  ]),
                ),

                const SizedBox(height: 50,),

                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AcademicInfo(),
                            maintainState: false),
                      );
                    }
                },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      elevation: 5,
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white
                  ),child: const Text(
                    "Next",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: 80,),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp(),
                                maintainState: false),
                          );
                        },
                        child: const Text(
                          'Login into Account',
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
    );
  }
}
