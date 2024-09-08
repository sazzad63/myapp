import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../main.dart';
import 'academic_info.dart';

final GlobalKey<FormState> _piFormKey = GlobalKey<FormState>();

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _piFormKey,
              child: Column(
                children: [
                const SizedBox(height: 10,),
                  Image.asset(
                    "assets/images/cover.png",
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 30,),
                  const Text(
                    "Registration Step-1 of 3",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  // const SizedBox(height: 5,),
                  // const Text("(Step 1 of 3)"),
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
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
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
                      if (_piFormKey.currentState!.validate()) {
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
      ),
    );
  }
}
