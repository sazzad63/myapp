import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:myapp/internal/dashboard.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context)!.settings;
    late String retriveUserName;

    if (data.arguments == null) {
      retriveUserName = "empty";
    } else {
      retriveUserName = data.arguments as String;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.teal,
            title: Text(retriveUserName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          body: Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Column(
              children: [

                const SizedBox(height: 30),

                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(200)),
                      border: Border.all(
                        width: 2,
                        color: Colors.black12
                      )
                    ),
                    child: const CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                        'assets/images/sazzad.jpeg',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30,),

                const Row(
                  children: [
                    Text("Name : ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Text("Md. Sazzad Hossain", style: TextStyle(fontSize: 18,),),
                  ],
                ),

                const SizedBox(height: 10,),

                const Row(
                  children: [
                    Text("Batch : ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Text("2006", style: TextStyle(fontSize: 18,),),
                  ],
                ),

                const SizedBox(height: 10,),

                const Row(
                  children: [
                    Text("Department : ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 30,),
                    Text("Science", style: TextStyle(fontSize: 18,),),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    const Text("Mobile : ", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 30,),
                    const Text("01922136511", style: TextStyle(fontSize: 18,),),

                    const SizedBox(width: 40,),
                    GestureDetector(
                      child: const Icon(Icons.phone,),
                      onTap: () {
                        FlutterPhoneDirectCaller.callNumber("01922136511");
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 70,),

                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                            maintainState: false),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        elevation: 5,
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white),
                    child: const Text(
                      "Back",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
