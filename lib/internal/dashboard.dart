import 'package:flutter/material.dart';
import 'package:myapp/internal/photo_update.dart';
import '../main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            elevation: 50,
            title: const Center(
              child: Text(
                "Welcome",
                style: TextStyle(color: Colors.white),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("Logout"),
                      ],
                    ),
                  )
                ],
                onSelected: (item) => selectedItem(context, item),
              )
            ],
          ),

          // start drawer menu list
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 100, 100, 1.0),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: const SizedBox(
                          height: 95,
                          width: 95,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/user_icon.png"),
                            child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white70,
                                      child: Icon(Icons.camera_alt),
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PhotoUpdate(),
                                maintainState: false),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Md. Sazzad Hossain",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.supervised_user_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text("My Teammates",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                          maintainState: false),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.info),
                      SizedBox(
                        width: 10,
                      ),
                      Text("About Community",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                          maintainState: false),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Logout",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyApp(),
                          maintainState: false),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

selectedItem(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyApp(), maintainState: false),
      );
      break;
  }
}
