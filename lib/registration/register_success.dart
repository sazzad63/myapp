import 'package:flutter/material.dart';

import '../main.dart';

class RegisterSuccess extends StatelessWidget {
  const RegisterSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 70,),
                const Text(
                  "Congratulations !",
                  style: TextStyle(
                      fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 50,),
                const Text(
                  "You have successfully submitted your registration. One of your team coordinator will process your request & contact you shortly. Thank you.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyApp(),
                            maintainState: false),
                      );
                    },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          elevation: 5,
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white
                      ),child: const Text(
                        "OK",
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
