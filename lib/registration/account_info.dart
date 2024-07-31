import 'package:flutter/material.dart';
import 'package:myapp/registration/register_success.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import 'academic_info.dart';

final _formKey = GlobalKey<FormState>();

final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();


class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

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
                const Text("(Step 3 of 3)"),
                const SizedBox(height: 30,),

                const SizedBox(height: 15,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: 'Enter Password'
                  ),
                  validator: Validators.compose([
                    Validators.required('Enter your password'),
                    Validators.minLength(
                        6, 'Password minimum 6 characters in length'),
                    Validators.maxLength(
                        8, 'Password maximum 8 characters in length'),
                  ]),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: 'Enter Confirm Password'
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter confirm password';
                    }else if(value !=_passwordController.text){
                      return 'Password & confirm password does not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const AcademicInfo(),
                                maintainState: false),
                          );
                        },
                        child: const Text("Back"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          //   print("Success");

                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              // title: const Text("Title"),
                              content: const Text("Are you sure? want to final submit your registration?"),
                              actions: [
                                TextButton(child: const Text("Confirm"), onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const RegisterSuccess(),
                                        maintainState: false),
                                  );
                                },),
                                TextButton(child: const Text("Cancel"), onPressed: () {
                                  Navigator.pop(context, false);
                                },)
                              ],
                              elevation: 24,
                            ),
                          );
                        }
                    },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          elevation: 5,
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white
                      ),child: const Text(
                        "Submit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
